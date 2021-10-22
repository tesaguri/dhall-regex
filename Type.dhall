let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let Regex
    : Type
    = forall (Regex : Type) -> forall (visitor : Visitor Regex) -> Regex

in  Regex
