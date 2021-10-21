let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let literal
    : Text -> Regex
    = \(x : Text) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.literal x

in  literal
