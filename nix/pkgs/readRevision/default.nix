{ pkgs }:

with pkgs;
with lib;

# EXAMPLE:
# update command example:
# nix-prefetch-git https://github.com/srghma/dunsted-volume > $DOTFILES/nixos/root/prefetched-git-revisions/dunsted-volume.json

# test match like `nix-instantiate --eval -E 'builtins.match "https?://.*/(.*)/(.*)" "https://github.com/srghma/dunsted-volume"'`
path:

let
  revData = builtins.fromJSON (builtins.readFile path);
  url     = revData.url;

  m       = builtins.match "https?://.*/(.*)/(.*)" url;
  owner   = builtins.elemAt m 0;
  repo    = builtins.elemAt m 1;
in { inherit owner repo; inherit (revData) rev sha256; }
