let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let GroupKind = ./GroupKind.dhall

let capture
    : Regex -> Regex
    = \(expr : Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group
          { kind = GroupKind.CaptureIndex, expr = expr Regex visitor }

in  capture
