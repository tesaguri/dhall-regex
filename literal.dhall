let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

let literal
    : Text -> Regex
    = \(x : Text) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.literal x

in  literal
