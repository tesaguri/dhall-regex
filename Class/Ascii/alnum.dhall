let Ascii =
      ./core.dhall
        sha256:264e1398357a1b01cc291613257b8d5d525f2ff11935288cbe4d14338fab3156

let alnum
    : Ascii.Type
    = Ascii::{ kind = Ascii.Kind.Alnum }

in  alnum
