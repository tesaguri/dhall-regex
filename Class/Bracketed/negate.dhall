let Bracketed =
      ./Type.dhall
        sha256:3f2e1110d512712d68ca052fc0b5cbf28bbf4bbca154cffecf972ddaca3f1040

let negate
    : Bracketed -> Bracketed
    = \(x : Bracketed) -> x with negated = x.negated == False

in  negate
