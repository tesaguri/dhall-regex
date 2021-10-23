let Regex =
      ./Type.dhall
        sha256:b767421fdb047ab22540b332eada0e822bc3361e05ae3e46572554ad9d2cbaa8

let Visitor =
      ./Visitor.dhall
        sha256:52ace10065c920658b29972adb042c6b5281054af22968436ff5cef78c9989ab

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
