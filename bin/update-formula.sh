#!/usr/bin/env bash
# Self-update the ferro formula from the latest PUBLISHED ferro GitHub release.
# Runs INSIDE the homebrew-ferro tap (scheduled + manual). No external token:
# reads ferro's public releases, commits to its own repo with the built-in GITHUB_TOKEN.
set -euo pipefail

REPO="albertogferrario/ferro"
TEMPLATE="Formula/ferro.rb.tpl"
FORMULA="Formula/ferro.rb"

# Latest published (non-draft, non-prerelease) release tag. On 404/none, gh exits
# non-zero — exit cleanly. NOTE: `gh api --jq` prints the raw error body to stdout on
# failure, so we MUST branch on the exit status, not on whether stdout is empty.
if ! TAG=$(gh api "repos/${REPO}/releases/latest" --jq '.tag_name' 2>/dev/null); then
  echo "No published ${REPO} release yet — nothing to do."
  exit 0
fi
# Belt-and-suspenders: a real tag looks like v1.2.3 or 1.2.3. Anything else → skip.
case "${TAG}" in
  v[0-9]*|[0-9]*) ;;
  *) echo "Unexpected tag '${TAG}' — skipping."; exit 0 ;;
esac
VER="${TAG#v}"

# Skip if already at this version with real (non-placeholder) checksums.
ZEROS="0000000000000000000000000000000000000000000000000000000000000000"
if grep -q "/v${VER}/" "${FORMULA}" && ! grep -q "${ZEROS}" "${FORMULA}"; then
  echo "Formula already at ${VER} with real checksums — nothing to do."
  exit 0
fi

BASE="https://github.com/${REPO}/releases/download/${TAG}"
sha() {
  # Fail cleanly (empty) if the asset is missing rather than aborting the run.
  local out
  if ! out=$(curl -fsSL "$1" 2>/dev/null | { command -v sha256sum >/dev/null 2>&1 && sha256sum || shasum -a 256; } | awk '{print $1}'); then
    echo ""; return 0
  fi
  echo "$out"
}

echo "Computing checksums for ferro ${VER}..."
S_MACOS_ARM=$(sha "${BASE}/ferro-${TAG}-aarch64-apple-darwin.tar.gz")
S_MACOS_X86=$(sha "${BASE}/ferro-${TAG}-x86_64-apple-darwin.tar.gz")
S_LINUX_ARM=$(sha "${BASE}/ferro-${TAG}-aarch64-unknown-linux-gnu.tar.gz")
S_LINUX_X86=$(sha "${BASE}/ferro-${TAG}-x86_64-unknown-linux-gnu.tar.gz")

# If any asset's checksum is empty, the release isn't fully published — skip this run.
for s in "$S_MACOS_ARM" "$S_MACOS_X86" "$S_LINUX_ARM" "$S_LINUX_X86"; do
  if [ -z "$s" ] || [ "${#s}" -ne 64 ]; then
    echo "Release ${TAG} is missing one or more platform tarballs — skipping until assets exist."
    exit 0
  fi
done

sed -e "s/VERSION_PLACEHOLDER/${VER}/g" \
    -e "s/SHA256_MACOS_ARM64/${S_MACOS_ARM}/g" \
    -e "s/SHA256_MACOS_X86_64/${S_MACOS_X86}/g" \
    -e "s/SHA256_LINUX_AARCH64/${S_LINUX_ARM}/g" \
    -e "s/SHA256_LINUX_X86_64/${S_LINUX_X86}/g" \
    "${TEMPLATE}" > "${FORMULA}"

git config user.name  "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"
git add "${FORMULA}"
if git diff --staged --quiet; then
  echo "No change after render."
  exit 0
fi
git commit -m "chore: bump ferro to ${VER}"
git push
echo "Tap formula updated to ${VER}."
