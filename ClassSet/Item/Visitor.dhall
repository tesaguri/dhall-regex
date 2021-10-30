let ClassBracketed =
      ../../ClassBracketed.dhall
        sha256:c86e7dff4075f4346339e1c951bbf85dce42a0d5c08678c5b2e9e0a2723e07cc

let ClassAscii =
      ../../ClassAscii.dhall
        sha256:7d838c80608b23035cc930255c97895ddc1f522f114a4e31bb4c47ce5ab076d9

let ClassUnicode =
      ../../ClassUnicode.dhall
        sha256:d57d7ce4c955bf8c6f52a917d95587b607489d3380b7717293215c9d51b3c3bc

let ClassPerl =
      ../../ClassPerl.dhall
        sha256:0af51f6bec641f3ecf5cf74b6feab9113a00c8ac9d35a4a78439a151f4a5d9c4

let Visitor
    : Type -> Type -> Type
    = \(ClassSet : Type) ->
      \(Item : Type) ->
        { empty : Item
        , literal : Text -> Item
        , range : { start : Text, end : Text } -> Item
        , ascii : ClassAscii -> Item
        , unicode : ClassUnicode -> Item
        , perl : ClassPerl -> Item
        , bracketed : ClassBracketed ClassSet -> Item
        , union : List Item -> Item
        }

in  Visitor
