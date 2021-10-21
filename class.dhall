let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Class = ./ClassType.dhall

let class
    : Class -> Regex
    = \(x : Class) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.class x

in  class
