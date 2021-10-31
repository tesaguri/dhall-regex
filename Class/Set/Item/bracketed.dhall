let Bracketed =
      ../../Bracketed/Type.dhall
        sha256:c86e7dff4075f4346339e1c951bbf85dce42a0d5c08678c5b2e9e0a2723e07cc

let Item =
      ./Type.dhall
        sha256:6e19b33f57edfc5f618e6161ef343c230fabcd41c4780a1d2a580e28dd857e5f

let Visitor =
      ./Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let Set =
      ../Type.dhall
        sha256:13becad51ab4cd5a2f3fc15882cb392a2cd9561e44f43fca944ce9cff063c0cd

let SetVisitor =
      ../Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let bracketed
    : Bracketed Set -> Item
    = \(x : Bracketed Set) ->
      \(Set : Type) ->
      \(Item : Type) ->
      \(set : SetVisitor Set Item) ->
      \(item : Visitor Set Item) ->
        item.bracketed (x with kind = x.kind Set Item set item)

in  bracketed
