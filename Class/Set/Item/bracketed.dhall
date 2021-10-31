let Bracketed =
      ../../Bracketed/Type.dhall
        sha256:3f2e1110d512712d68ca052fc0b5cbf28bbf4bbca154cffecf972ddaca3f1040

let Item =
      ./Type.dhall
        sha256:6e19b33f57edfc5f618e6161ef343c230fabcd41c4780a1d2a580e28dd857e5f

let Visitor =
      ./Visitor.dhall
        sha256:02fdd689d3f2fabcc0a61c31bf256d3d23c744abacea562b7f42822562a02bb0

let SetVisitor =
      ../Visitor.dhall
        sha256:cf774f0c533d6af1263c8eba37b959ad0563923ce138fb418027ce066c5dc082

let bracketed
    : Bracketed -> Item
    = \(x : Bracketed) ->
      \(Set : Type) ->
      \(Item : Type) ->
      \(set : SetVisitor Set Item) ->
      \(item : Visitor Set Item) ->
        item.bracketed (x with kind = x.kind Set Item set item)

in  bracketed
