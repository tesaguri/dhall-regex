let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let dot
    : Regex
    = \(Regex : Type) -> \(visitor : Visitor Regex) -> visitor.dot

in  dot
