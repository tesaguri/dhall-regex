let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let empty
    : Regex
    = \(Regex : Type) -> \(visitor : Visitor Regex) -> visitor.empty

in  empty
