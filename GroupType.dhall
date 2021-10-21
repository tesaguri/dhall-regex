let GroupKind = ./GroupKind.dhall

let Group
    : forall (Regex : Type) -> Type
    = \(Regex : Type) -> { kind : GroupKind, expr : Regex }

in  Group
