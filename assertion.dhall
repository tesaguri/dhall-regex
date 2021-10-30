let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Assertion =
      ./AssertionType.dhall
        sha256:843c329a28a72d2a5854051885a5d694a06cb151aff60c8e464e79fba15022a7

let assertion
    : Assertion -> Regex
    = \(x : Assertion) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.assertion x

in  assertion
