let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Flag = ./Flag.dhall

let GroupKind = ./GroupKind.dhall

let Repetition = ./RepetitionType.dhall

let repetition
    : Repetition Regex -> Regex
    = \(x : Repetition Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        let expr = x.expr Regex visitor in visitor.repetition (x // { expr })

in  repetition
