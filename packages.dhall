let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8/packages.dhall sha256:0e95ec11604dc8afc1b129c4d405dcc17290ce56d7d0665a0ff15617e32bbf03

let overrides =
      { argonaut-core =
              upstream.argonaut-core
          //  { repo = "https://github.com/srghma/purescript-argonaut-core.git"
              , version = "master"
              }
      , argonaut-codecs =
              upstream.argonaut-codecs
          //  { repo =
                  "https://github.com/purescript-contrib/purescript-argonaut-codecs.git"
              , version = "master"
              }
      , argonaut-generic =
              upstream.argonaut-generic
          //  { repo =
                  "https://github.com/purescript-contrib/purescript-argonaut-generic.git"
              , version = "master"
              }
      , either =
              upstream.either
          //  { repo =
                  "https://github.com/srghma/purescript-either.git"
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
          [ "prelude"
          , "effect"
          , "node-fs-aff"
          , "node-fs"
          , "node-path"
          , "either"
          , "exceptions"
          , "aff"
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
          , "matryoshka"
          , "ordered-collections"
          , "psci-support"
          , "record"
          , "record-extra"
          , "strings"
          , "strings-extra"
          , "unicode"
          , "boxes"
          ]
        , repo = "https://github.com/srghma/purescript-ps-cst.git"
        , version = "master"
        }
      , matryoshka =
        { dependencies =
          [ "fixed-points", "free", "prelude", "profunctor", "transformers" ]
        , repo = "https://github.com/slamdata/purescript-matryoshka.git"
        , version = "master"
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
      }

in  upstream // overrides // additions
