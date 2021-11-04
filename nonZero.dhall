let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Regex/repetition =
      ./repetition.dhall
        sha256:87374bc80158a972a4cbe504a98f96247ea1534e4031a41d1a7d6cbc38df940f

let RepetitionKind =
      ./Repetition/Kind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let nonZero
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.OneOrMore, greedy = True, expr }

in  nonZero
