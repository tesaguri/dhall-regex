let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let multi
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.ZeroOrMore, greedy = True, expr }

in  multi
