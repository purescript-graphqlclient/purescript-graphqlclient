{ pkgs, fetchFromGitHub, readRevision, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );
in
  import "${src}/default.nix" { inherit pkgs; }
