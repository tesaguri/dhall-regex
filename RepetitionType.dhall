let RepetitionKind = ./RepetitionKind.dhall

let Repetition
    : Type -> Type
    = \(Regex : Type) -> { kind : RepetitionKind, greedy : Bool, expr : Regex }

in  Repetition
