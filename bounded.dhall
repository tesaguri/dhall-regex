let Regex = ./Type.dhall

let Regex/repetition = ./repetition.dhall

let RepetitionKind = ./RepetitionKind.dhall

let bounded
    : Natural -> Natural -> Regex -> Regex
    = \(start : Natural) ->
      \(end : Natural) ->
      \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.Bounded { start, end }, greedy = True, expr }

in  bounded
