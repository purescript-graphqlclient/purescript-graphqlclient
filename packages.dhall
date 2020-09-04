let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20200716/packages.dhall sha256:c4683b4c4da0fd33e0df86fc24af035c059270dd245f68b79a7937098f6c6542

let overrides =
      { argonaut-core =
              upstream.argonaut-core
          //  { repo = "https://github.com/srghma/purescript-argonaut-core.git"
              , version = "master"
              }
      , either =
              upstream.either
          //  { repo = "https://github.com/srghma/purescript-either.git"
              , version = "patch-1"
              }
      }

let additions =
      { mkdirp-aff =
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
      , protolude =
        { dependencies =
          [ "affjax"
          , "console"
          , "effect"
          , "node-fs-aff"
          , "node-process"
          , "node-path"
          , "prelude"
          , "proxy"
          , "psci-support"
          , "record"
          , "typelevel-prelude"
          , "debug"
          , "variant"
          , "ansi"
          , "generics-rep"
          ]
        , repo = "https://github.com/srghma/purescript-protolude.git"
        , version = "master"
        }
      , ps-cst =
        { dependencies =
          [ "console"
          , "effect"
          , "generics-rep"
          , "heterogeneous"
          , "ordered-collections"
          , "psci-support"
          , "record"
          , "record-extra"
          , "strings"
          , "strings-extra"
          , "unicode"
          , "boxes"
          ]
        , repo = "https://github.com/purescript-codegen/purescript-ps-cst.git"
        , version = "a94ff4a6baadd35da0c42fcd8a5b8efd336d324e"
        }
      , boxes =
        { dependencies =
          [ "generics-rep", "prelude", "profunctor", "strings", "stringutils" ]
        , repo = "https://github.com/srghma/purescript-boxes.git"
        , version = "master"
        }
      , homogeneous-records =
        { dependencies =
          [ "record", "prelude", "typelevel-prelude", "unfoldable", "control" ]
        , repo = "https://github.com/srghma/purescript-homogeneous-records.git"
        , version = "master"
        }
      , unordered-collection =
        { dependencies =
          [ "enums"
          , "functions"
          , "integers"
          , "lists"
          , "prelude"
          , "record"
          , "tuples"
          , "typelevel-prelude"
          ]
        , repo =
            "https://github.com/fehrenbach/purescript-unordered-collections.git"
        , version = "master"
        }
      }

in  upstream // overrides // additions
