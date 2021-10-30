let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Group =
      ./GroupType.dhall
        sha256:0f262c2f20c4398ca7225db3c8571135e37cfce10b1a7f74f66977f8e28ea644

let group
    : Group Regex -> Regex
    = \(x : Group Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group (x with expr = x.expr Regex visitor)

in  group
