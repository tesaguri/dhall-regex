let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

let Class =
      ./ClassType.dhall
        sha256:755ec5680e139a89af59658e28dada8455a2173c1992d5ccdbd972d2e3eb4274

let class
    : Class -> Regex
    = \(x : Class) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.class x

in  class
