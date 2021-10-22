let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let exactly
    : Natural -> Regex -> Regex
    = \(n : Natural) ->
      \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.Exactly n, greedy = True, expr }

in  exactly
