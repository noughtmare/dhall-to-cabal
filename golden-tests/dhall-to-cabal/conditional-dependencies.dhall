let prelude = ../../dhall/prelude.dhall

let types = ../../dhall/types.dhall

let v = prelude.v

let ghcImpl =
        λ(cfg : types.Config)
      → λ(ver : types.VersionRange)
      → cfg.impl types.Compiler.GHC ver

in    ../../dhall/defaults/Package.dhall
    ⫽ { name =
          "Name"
      , version =
          v "1"
      , library =
          Some
          (   λ(config : types.Config)
            →   prelude.defaults.MainLibrary
              ⫽ { build-depends =
                      [ { package = "A", bounds = prelude.anyVersion, library-names = [ types.LibraryName.main-library ] } ]
                    # (       if ghcImpl
                                 config
                                 (prelude.orLaterVersion (v "8.2"))
                        
                        then  [ { package = "B", bounds = prelude.anyVersion, library-names = [ types.LibraryName.main-library ] } ]
                        
                        else  [] : List types.Dependency
                      )
                    # (       if ghcImpl
                                 config
                                 (prelude.orLaterVersion (v "8.4"))
                        
                        then  [ { package = "C", bounds = prelude.anyVersion, library-names = [ types.LibraryName.main-library ] } ]
                        
                        else  [] : List types.Dependency
                      )
                }
          )
      }
