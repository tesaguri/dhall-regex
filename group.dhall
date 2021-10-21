let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Group = ./GroupType.dhall

let group
    : Group Regex -> Regex
    = \(x : Group Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group (x with expr = x.expr Regex visitor)

in  group
