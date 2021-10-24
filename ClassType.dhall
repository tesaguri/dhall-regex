let ClassUnicode =
      ./ClassUnicode.dhall
        sha256:d57d7ce4c955bf8c6f52a917d95587b607489d3380b7717293215c9d51b3c3bc

let ClassPerl =
      ./ClassPerl.dhall
        sha256:0af51f6bec641f3ecf5cf74b6feab9113a00c8ac9d35a4a78439a151f4a5d9c4

let ClassBracketed =
      ./ClassBracketed.dhall
        sha256:1b57497be16d9ad805d9bf729f3acd93371437bac63aeb41cf6cb0a318727035

let Class
    : Type
    = < Unicode : ClassUnicode | Perl : ClassPerl | Bracketed : ClassBracketed >

in  Class
