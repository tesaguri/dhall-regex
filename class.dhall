let Regex =
      ./Type.dhall
        sha256:b767421fdb047ab22540b332eada0e822bc3361e05ae3e46572554ad9d2cbaa8

let Visitor =
      ./Visitor.dhall
        sha256:52ace10065c920658b29972adb042c6b5281054af22968436ff5cef78c9989ab

let Class =
      ./ClassType.dhall
        sha256:8dbd3ead5090c8870045aa9c1912206620303c82f4a20495aef293af4fe8c364

let class
    : Class -> Regex
    = \(x : Class) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.class x

in  class
