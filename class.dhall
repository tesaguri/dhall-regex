let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let Class =
      ./ClassType.dhall
        sha256:1b57497be16d9ad805d9bf729f3acd93371437bac63aeb41cf6cb0a318727035

let class
    : Class -> Regex
    = \(x : Class) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.class x

in  class
