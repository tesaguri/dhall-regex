let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let GroupKind =
      ./GroupKind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let captureAs
    : Text -> Regex -> Regex
    = \(name : Text) ->
      \(expr : Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group
          { kind = GroupKind.CaptureName name, expr = expr Regex visitor }

in  captureAs
