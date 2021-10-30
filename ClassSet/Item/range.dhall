let Item =
      ./Type.dhall
        sha256:6e19b33f57edfc5f618e6161ef343c230fabcd41c4780a1d2a580e28dd857e5f

let Visitor =
      ./Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let ClassSetVisitor =
      ../Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let range
    : Text -> Text -> Item
    = \(start : Text) ->
      \(end : Text) ->
      \(ClassSet : Type) ->
      \(Item : Type) ->
      \(classSet : ClassSetVisitor ClassSet Item) ->
      \(item : Visitor ClassSet Item) ->
        item.range { start, end }

in  range
