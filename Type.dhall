let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Regex
    : Type
    = forall (Regex : Type) -> forall (visitor : Visitor Regex) -> Regex

in  Regex
