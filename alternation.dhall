let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let alternation
    : List Regex -> Regex
    = \(x : List Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.alternation
          (List/map Regex@1 Regex (\(expr : Regex@1) -> expr Regex visitor) x)

in  alternation
