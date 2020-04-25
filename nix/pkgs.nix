let
  nixpkgs = import ./nixpkgs;

  config = { allowUnfree = true; };

  overlays = import ./overlays.nix;
in import nixpkgs { inherit config overlays; }
