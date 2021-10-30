let ClassSet =
      ./Type.dhall
        sha256:13becad51ab4cd5a2f3fc15882cb392a2cd9561e44f43fca944ce9cff063c0cd

let Visitor =
      ./Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let ItemVisitor =
      ./Item/Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let BinaryOpKind =
      ./BinaryOpKind.dhall
        sha256:2c3ca7ab8a8285994ce9e9cac0dbf7eeffe37ee35dc06b83db62f1ab7ece5ad6

let binaryOp
    : ClassSet -> BinaryOpKind -> ClassSet -> ClassSet
    = \(lhs : ClassSet) ->
      \(op : BinaryOpKind) ->
      \(rhs : ClassSet) ->
      \(ClassSet : Type) ->
      \(Item : Type) ->
      \(classSet : Visitor ClassSet Item) ->
      \(item : ItemVisitor ClassSet Item) ->
        let lhs = lhs ClassSet Item classSet item

        let rhs = rhs ClassSet Item classSet item

        in  classSet.binaryOp { op, lhs, rhs }

in  binaryOp
