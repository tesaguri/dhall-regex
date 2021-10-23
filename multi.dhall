let Regex =
      ./Type.dhall
        sha256:b767421fdb047ab22540b332eada0e822bc3361e05ae3e46572554ad9d2cbaa8

let Regex/repetition =
      ./repetition.dhall
        sha256:7978f8e6e232b773314bb0485059b74eba5a641d45c0b6e74798610b5bae440d

let RepetitionKind =
      ./RepetitionKind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let multi
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.ZeroOrMore, greedy = True, expr }

in  multi
