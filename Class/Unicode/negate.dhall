let Unicode =
      ./Type.dhall
        sha256:d57d7ce4c955bf8c6f52a917d95587b607489d3380b7717293215c9d51b3c3bc

let negate
    : Unicode -> Unicode
    = \(x : Unicode) -> x with negated = x.negated == False

in  negate
