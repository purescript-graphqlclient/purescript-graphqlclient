pkgs: pkgsOld:
{
  rootProjectDir                = toString ../..;
  readRevision                  = pkgs.callPackage ./readRevision {};
  easy-purescript-nix-automatic = pkgs.callPackage ./easy-purescript-nix-automatic {};
}
