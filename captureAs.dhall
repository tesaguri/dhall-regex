let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let GroupKind = ./GroupKind.dhall

let captureAs
    : Text -> Regex -> Regex
    = \(name : Text) ->
      \(expr : Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group
          { kind = GroupKind.CaptureName name, expr = expr Regex visitor }

in  captureAs
