let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let literal
    : Text -> Regex
    = \(x : Text) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.literal x

in  literal
