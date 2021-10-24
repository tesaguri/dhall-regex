let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

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
