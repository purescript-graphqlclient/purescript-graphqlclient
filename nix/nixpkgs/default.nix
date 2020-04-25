let
  spec = builtins.fromJSON (builtins.readFile ./revision.json);

  src = import <nix/fetchurl.nix> {
    url = "https://github.com/${spec.owner}/${spec.repo}/archive/${spec.rev}.tar.gz";
    inherit (spec) sha256;
  };

  nixcfg = import <nix/config.nix>;

  nixpkgs = builtins.derivation {
    inherit src;
    system = builtins.currentSystem;
    name = "${src.name}-unpacked";
    builder = builtins.storePath nixcfg.shell;
    args = [
      (builtins.toFile "builder" ''
        $coreutils/mkdir $out
        cd $out
        $gzip -d < $src | $tar -x --strip-components=1
      '')
    ];
    coreutils = builtins.storePath nixcfg.coreutils;
    tar = builtins.storePath nixcfg.tar;
    gzip = builtins.storePath nixcfg.gzip;
  };
in
  nixpkgs
