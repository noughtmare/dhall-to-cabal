-- This file is auto-generated by dhall-to-cabal-meta. Look but don't touch (unless you want your edits to be over-written).
let types = ../types.dhall

in    ./BuildInfo.dhall
    ⫽ { exposed-modules =
          [] : List Text
      , reexported-modules =
          [] : List
               { name :
                   Text
               , original :
                   { name : Text, package : Optional Text }
               }
      , signatures =
          [] : List Text
      , visibility =
          types.LibraryVisibility.public
      }
