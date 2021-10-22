let RepetitionKind =
      ./RepetitionKind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let Repetition
    : Type -> Type
    = \(Regex : Type) -> { kind : RepetitionKind, greedy : Bool, expr : Regex }

in  Repetition
