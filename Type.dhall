let Visitor =
      ./Visitor.dhall
        sha256:52ace10065c920658b29972adb042c6b5281054af22968436ff5cef78c9989ab

let Regex
    : Type
    = forall (Regex : Type) -> forall (visitor : Visitor Regex) -> Regex

in  Regex
