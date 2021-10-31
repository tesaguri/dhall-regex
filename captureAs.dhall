let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let GroupKind =
      ./Group/Kind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let captureAs
    : Text -> Regex -> Regex
    = \(name : Text) ->
      \(expr : Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group
          { kind = GroupKind.CaptureName name, expr = expr Regex visitor }

in  captureAs
