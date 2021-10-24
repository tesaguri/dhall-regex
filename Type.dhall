let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

let Regex
    : Type
    = forall (Regex : Type) -> forall (visitor : Visitor Regex) -> Regex

in  Regex
