let Unicode =
      ./Unicode/Type.dhall
        sha256:d57d7ce4c955bf8c6f52a917d95587b607489d3380b7717293215c9d51b3c3bc

let Perl =
      ./Perl/Type.dhall
        sha256:0af51f6bec641f3ecf5cf74b6feab9113a00c8ac9d35a4a78439a151f4a5d9c4

let Bracketed =
      ./Bracketed/Type.dhall
        sha256:3f2e1110d512712d68ca052fc0b5cbf28bbf4bbca154cffecf972ddaca3f1040

let Class
    : Type
    = < Unicode : Unicode | Perl : Perl | Bracketed : Bracketed >

in  Class
