let ClassUnicode =
      ./ClassUnicode.dhall
        sha256:d57d7ce4c955bf8c6f52a917d95587b607489d3380b7717293215c9d51b3c3bc

let ClassPerl =
      ./ClassPerl.dhall
        sha256:0af51f6bec641f3ecf5cf74b6feab9113a00c8ac9d35a4a78439a151f4a5d9c4

let ClassBracketed =
      ./ClassBracketed.dhall
        sha256:c86e7dff4075f4346339e1c951bbf85dce42a0d5c08678c5b2e9e0a2723e07cc

let ClassSet =
      ./ClassSet/Type.dhall
        sha256:13becad51ab4cd5a2f3fc15882cb392a2cd9561e44f43fca944ce9cff063c0cd

let Class
    : Type
    = < Unicode : ClassUnicode
      | Perl : ClassPerl
      | Bracketed : ClassBracketed ClassSet
      >

in  Class
