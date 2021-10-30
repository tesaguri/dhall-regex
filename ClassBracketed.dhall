let ClassBracketed
    : Type -> Type
    = \(ClassSet : Type) -> { kind : ClassSet, negated : Bool }

in  ClassBracketed
