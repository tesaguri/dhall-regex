let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let flags
    : List Flag -> Regex
    = \(xs : List Flag) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.flags xs

in  flags
