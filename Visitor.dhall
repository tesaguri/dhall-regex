let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let Assertion =
      ./AssertionType.dhall
        sha256:843c329a28a72d2a5854051885a5d694a06cb151aff60c8e464e79fba15022a7

let Class =
      ./ClassType.dhall
        sha256:1b57497be16d9ad805d9bf729f3acd93371437bac63aeb41cf6cb0a318727035

let Repetition =
      ./RepetitionType.dhall
        sha256:c0f41cb47504d6d5fb9f34d93a9c731f3c08e3efc704867af30f9155c7942a24

let Group =
      ./GroupType.dhall
        sha256:0f262c2f20c4398ca7225db3c8571135e37cfce10b1a7f74f66977f8e28ea644

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
