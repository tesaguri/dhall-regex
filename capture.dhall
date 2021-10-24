let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

let GroupKind =
      ./GroupKind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let capture
    : Regex -> Regex
    = \(expr : Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.group
          { kind = GroupKind.CaptureIndex, expr = expr Regex visitor }

in  capture
