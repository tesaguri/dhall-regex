let Flag = ./Flag.dhall

let Assertion = ./AssertionType.dhall

let Class = ./ClassType.dhall

let Repetition = ./RepetitionType.dhall

let Group = ./GroupType.dhall

let Visitor
    : forall (Regex : Type) -> Type
    = \(Regex : Type) ->
        { empty : Regex
        , flags : List Flag -> Regex
        , literal : Text -> Regex
        , dot : Regex
        , assertion : Assertion -> Regex
        , class : Class -> Regex
        , repetition : Repetition Regex -> Regex
        , group : Group Regex -> Regex
        , alternation : List Regex -> Regex
        , concat : List Regex -> Regex
        }

in  Visitor
