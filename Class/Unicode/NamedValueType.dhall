let OpKind =
      ./OpKind.dhall
        sha256:4cc6c72c660890aacec3c2369b3046e757e73e12f7d0f88fadd46885c1d6049f

let NamedValue
    : Type
    = { op : OpKind, name : Text, value : Text }

in  NamedValue
