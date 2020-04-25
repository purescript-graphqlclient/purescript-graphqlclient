[
  (pkgs: pkgsOld: {
    nodejs       = pkgsOld.nodejs-13_x;
    nodePackages = pkgsOld.nodePackages_13_x;
  })
  (import ./pkgs/overlay.nix)
]
