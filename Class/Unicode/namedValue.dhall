let Unicode =
      ./core.dhall
        sha256:663552d72a8dc2e337938ae98f743f88c49f205fd4e449c303f95254226b7fd3

let namedValue
    : Text -> Unicode.OpKind -> Text -> Unicode.Type
    = \(name : Text) ->
      \(op : Unicode.OpKind) ->
      \(value : Text) ->
        Unicode::{ kind = Unicode.Kind.NamedValue { op, name, value } }

in  namedValue
