let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Assertion = ./AssertionType.dhall

let assertion
    : Assertion -> Regex
    = \(x : Assertion) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.assertion x

in  assertion
