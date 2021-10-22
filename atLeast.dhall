let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let atLeast
    : Natural -> Regex -> Regex
    = \(n : Natural) ->
      \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.AtLeast n, greedy = True, expr }

in  atLeast
