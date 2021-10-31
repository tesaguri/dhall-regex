let AsciiKind =
      ./Kind.dhall
        sha256:49363976be49b8cb540b7d08b770cbd42a977d65c6cd1136b6cc537185a476a3

let Ascii = { kind : AsciiKind, negated : Bool }

in  Ascii
