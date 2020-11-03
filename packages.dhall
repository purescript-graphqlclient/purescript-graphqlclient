let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20201021/packages.dhall sha256:55ebdbda1bd6ede4d5307fbc1ef19988c80271b4225d833c8d6fb9b6fb1aa6d8

in (    upstream
    //  https://raw.githubusercontent.com/srghma/my-purescript-package-sets/65e3d6267a6038a4905ad5703ef756113ad05a00/packages.dhall sha256:8a417337a6e3c5cee69e56e95c7abb8b47f5e507e377f1cf502c8737cadb8533
          upstream.(https://raw.githubusercontent.com/srghma/my-purescript-package-sets/65e3d6267a6038a4905ad5703ef756113ad05a00/upstreamTypeChunk.dhall sha256:a123bf398ed3e5092620d356e1fe291dd176e5f520664308f0981d3ed088af09)
   )
  with affjax.version = "v11.0.0"
