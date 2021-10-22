let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let optional
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.ZeroOrOne, greedy = True, expr }

in  optional
