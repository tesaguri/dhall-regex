let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let nonZero
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.OneOrMore, greedy = True, expr }

in  nonZero
