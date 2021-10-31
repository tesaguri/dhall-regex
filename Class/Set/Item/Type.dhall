let Visitor =
      ./Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let SetVisitor =
      ../Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let Item
    : Type
    = forall (Set : Type) ->
      forall (Item : Type) ->
      forall (set : SetVisitor Set Item) ->
      forall (item : Visitor Set Item) ->
        Item

in  Item
