let Asci =
      ./Type.dhall
        sha256:7d838c80608b23035cc930255c97895ddc1f522f114a4e31bb4c47ce5ab076d9

let negate
    : Asci -> Asci
    = \(x : Asci) -> x with negated = x.negated == False

in  negate
