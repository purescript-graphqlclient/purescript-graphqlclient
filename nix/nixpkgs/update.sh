#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix curl jq

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")

owner="nixos"
repo="nixpkgs-channels"
rev="nixos-unstable"

full_rev=$(curl --silent https://api.github.com/repos/$owner/$repo/git/refs/heads/$rev | jq -r .object.sha)

echo "full_rev=$full_rev"

expected_sha=$(nix-prefetch-url https://github.com/$owner/$repo/archive/$full_rev.tar.gz)

cat >"$SCRIPT_DIR/revision.json" <<EOL
{
  "owner":  "$owner",
  "repo":   "$repo",
  "rev":    "$full_rev",
  "sha256": "$expected_sha"
}
EOL
