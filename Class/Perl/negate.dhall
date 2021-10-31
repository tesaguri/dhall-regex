let Perl =
      ./Type.dhall
        sha256:0af51f6bec641f3ecf5cf74b6feab9113a00c8ac9d35a4a78439a151f4a5d9c4

let negate
    : Perl -> Perl
    = \(x : Perl) -> x with negated = x.negated == False

in  negate
