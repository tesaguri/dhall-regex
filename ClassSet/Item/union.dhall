let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Item =
      ./Type.dhall
        sha256:6e19b33f57edfc5f618e6161ef343c230fabcd41c4780a1d2a580e28dd857e5f

let Visitor =
      ./Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let ClassSetVisitor =
      ../Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let union
    : List Item -> Item
    = \(xs : List Item) ->
      \(ClassSet : Type) ->
      \(Item : Type) ->
      \(classSet : ClassSetVisitor ClassSet Item) ->
      \(item : Visitor ClassSet Item) ->
        item.union
          ( List/map
              Item@1
              Item
              (\(x : Item@1) -> x ClassSet Item classSet item)
              xs
          )

in  union
