let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let Group =
      ./GroupType.dhall
        sha256:0f262c2f20c4398ca7225db3c8571135e37cfce10b1a7f74f66977f8e28ea644

let group
    : Group Regex -> Regex
    = \(x : Group Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group (x with expr = x.expr Regex visitor)

in  group
