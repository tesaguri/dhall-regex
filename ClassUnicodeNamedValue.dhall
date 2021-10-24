let ClassUnicodeOpKind =
      ./ClassUnicodeOpKind.dhall
        sha256:4cc6c72c660890aacec3c2369b3046e757e73e12f7d0f88fadd46885c1d6049f

let ClassUnicodeNamedValue
    : Type
    = { op : ClassUnicodeOpKind, name : Text, value : Text }

in  ClassUnicodeNamedValue
