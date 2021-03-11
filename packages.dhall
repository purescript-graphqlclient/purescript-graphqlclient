let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.0-20210311/packages.dhall sha256:3da8be2b7b4a0e7de6186591167b363023695accffb98a8639e9e7d06e2070d6

let other =
      { ps-cst =
        { dependencies =
          [ "console"
          , "effect"
          , "psci-support"
          , "record"
          , "strings"
          , "spec"
          , "node-path"
          , "node-fs-aff"
          , "ansi"
          , "dodo-printer"
          ]
        , repo = "https://github.com/purescript-codegen/purescript-ps-cst.git"
        , version = "master"
        }
      , dodo-printer =
        { dependencies =
          [ "aff"
          , "ansi"
          , "avar"
          , "console"
          , "effect"
          , "foldable-traversable"
          , "lists"
          , "maybe"
          , "minibench"
          , "node-child-process"
          , "node-fs-aff"
          , "node-process"
          , "psci-support"
          , "strings"
          ]
        , repo = "https://github.com/natefaubion/purescript-dodo-printer.git"
        , version = "master"
        }
      , homogeneous-records =
        { dependencies =
          [ "record", "prelude", "typelevel-prelude", "unfoldable", "control" ]
        , repo = "https://github.com/srghma/purescript-homogeneous-records.git"
        , version = "master"
        }
      , mkdirp-aff =
        { dependencies =
          [ "prelude"
          , "effect"
          , "node-fs-aff"
          , "node-fs"
          , "node-path"
          , "either"
          , "exceptions"
          , "aff"
          ]
        , repo = "https://github.com/leighman/purescript-mkdirp-aff.git"
        , version = "master"
        }
      , url-regex-safe =
        { dependencies = [ "console", "effect", "psci-support", "strings" ]
        , repo = "https://github.com/srghma/purescript-url-regex-safe.git"
        , version = "master"
        }
      }

in  upstream // other
