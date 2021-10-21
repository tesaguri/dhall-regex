let Visitor = ./Visitor.dhall

let Regex
    : Type
    = forall (Regex : Type) -> forall (visitor : Visitor Regex) -> Regex

in  Regex
