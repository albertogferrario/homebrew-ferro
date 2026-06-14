#!/usr/bin/env bash
# Self-update the ferro formula from the latest PUBLISHED ferro GitHub release.
# Runs INSIDE the homebrew-ferro tap repo (scheduled + manual). No external token:
# it reads ferro's public releases and commits to its own repo with the built-in GITHUB_TOKEN.
set -euo pipefail

REPO="albertogferrario/ferro"
TEMPLATE="Formula/ferro.rb.tpl"
FORMULA="Formula/ferro.rb"

# Latest published release tag (e.g. v0.2.59). Exit cleanly if none exists yet.
TAG=$(gh api "repos/${REPO}/releases/latest" --jq '.tag_name' 2>/dev/null || true)
if [ -z "${TAG}" ]; then
  echo "No published ${REPO} release yet — nothing to do."
  exit 0
fi
VER="${TAG#v}"

# Skip if already at this version with real (non-placeholder) checksums.
ZEROS="0000000000000000000000000000000000000000000000000000000000000000"
if grep -q "version \"${VER}\"" "${FORMULA}" && ! grep -q "${ZEROS}" "${FORMULA}"; then
  echo "Formula already at ${VER} with real checksums — nothing to do."
  exit 0
fi

BASE="https://github.com/${REPO}/releases/download/${TAG}"
sha() {
  # Portable: prefer sha256sum (Linux), fall back to shasum (macOS).
  if command -v sha256sum >/dev/null 2>&1; then
    curl -fsSL "$1" | sha256sum | awk '{print $1}'
  else
    curl -fsSL "$1" | shasum -a 256 | awk '{print $1}'
  fi
}

echo "Computing checksums for ferro ${VER}..."
S_MACOS_ARM=$(sha   "${BASE}/ferro-${TAG}-aarch64-apple-darwin.tar.gz")
S_MACOS_X86=$(sha   "${BASE}/ferro-${TAG}-x86_64-apple-darwin.tar.gz")
S_LINUX_ARM=$(sha   "${BASE}/ferro-${TAG}-aarch64-unknown-linux-gnu.tar.gz")
S_LINUX_X86=$(sha   "${BASE}/ferro-${TAG}-x86_64-unknown-linux-gnu.tar.gz")

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
