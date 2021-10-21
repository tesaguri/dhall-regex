let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Flag = ./Flag.dhall

let Group = ./GroupType.dhall

let GroupKind = ./GroupKind.dhall

let concat
    : List Regex -> Regex
    = \(x : List Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.concat
          (List/map Regex@1 Regex (\(expr : Regex@1) -> expr Regex visitor) x)

in  concat
