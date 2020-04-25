{
  pkgs ? import ./nix/pkgs.nix
}:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    pkgs.path # nixpkgs path, not dependency, add nixpkgs source to gc-root and prevent it to be gc collected
    # rootYarnModules

    gnumake
    git
    nix

    nodejs
    yarn

    # for building c++ extensions (from https://matrix.ai/2018/03/24/developing-with-nix/)
    # nodePackages.node-gyp
    # nodePackages.node-gyp-build
    # nodePackages.node-pre-gyp

    easy-purescript-nix-automatic.spago
    easy-purescript-nix-automatic.purs
    easy-purescript-nix-automatic.purty # find ./packages/client/src -name "*.purs" -exec purty --write {} \;
    # easy-purescript-nix-automatic.spago2nix
  ];

  # for https://www.npmjs.com/package/debug that is used at https://github.com/ethul/purs-loader
  # DEBUG = "purs-loader*";
  # DEBUG_DEPTH = "100";

  shellHook = ''
    export PATH="${pkgs.rootProjectDir}/node_modules/.bin/:$PATH"
  '';
}
