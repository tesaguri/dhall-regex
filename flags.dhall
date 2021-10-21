let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Flag = ./Flag.dhall

let flags
    : List Flag -> Regex
    = \(xs : List Flag) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.flags xs

in  flags
