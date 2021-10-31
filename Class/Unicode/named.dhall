let Unicode =
      ./core.dhall
        sha256:663552d72a8dc2e337938ae98f743f88c49f205fd4e449c303f95254226b7fd3

let named
    : Text -> Unicode.Type
    = \(x : Text) -> Unicode::{ kind = Unicode.Kind.Named x }

in  named
