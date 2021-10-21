let RepetitionKind
    : Type
    = < ZeroOrOne
      | ZeroOrMore
      | OneOrMore
      | Exactly : Natural
      | AtLeast : Natural
      | Bounded : { start : Natural, end : Natural }
      >

in  RepetitionKind
