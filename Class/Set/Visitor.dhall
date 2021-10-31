let BinaryOpKind =
      ./BinaryOpKind.dhall
        sha256:2c3ca7ab8a8285994ce9e9cac0dbf7eeffe37ee35dc06b83db62f1ab7ece5ad6

let Visitor
    : Type -> Type -> Type
    = \(ClassSet : Type) ->
      \(Item : Type) ->
        { item : Item -> ClassSet
        , binaryOp :
            { op : BinaryOpKind, lhs : ClassSet, rhs : ClassSet } -> ClassSet
        }

in  Visitor
