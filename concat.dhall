let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let Assertion =
      ./AssertionType.dhall
        sha256:843c329a28a72d2a5854051885a5d694a06cb151aff60c8e464e79fba15022a7

let Class =
      ./Class/Type.dhall
        sha256:a33699ae63659a01593395cc1589d434e964d5ae92d4aeda7c67b4535b7e61b9

let Group =
      ./Group/package.dhall
        sha256:13186df27f014eced0476e26776c11af5e6449a1d93ffec6d03dd2f0d8ef22d6

let Repetition =
      ./Repetition/Type.dhall
        sha256:3567e107cb4541d55dc3b839faf28ec4735dc6bfd9a019eaa0229498a584d482

let group =
      ./group.dhall
        sha256:77b3574e344ff4c4fb10cf1e339ff92569eac62ca0b4b7aa3267d223ecd88a9c

let concat
    : List Regex -> Regex
    = \(x : List Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.concat
          ( List/map
              Regex@1
              Regex
              ( \(expr : Regex@1) ->
                  let expr =
                        expr
                          Regex@1
                          { empty = expr
                          , flags = \(_ : List Flag) -> expr
                          , literal = \(_ : Text) -> expr
                          , dot = expr
                          , assertion = \(_ : Assertion) -> expr
                          , class = \(_ : Class) -> expr
                          , repetition = \(_ : Repetition) -> expr
                          , group = \(_ : Group.Type Regex@1) -> expr
                          , alternation =
                              \(_ : List Regex@1) ->
                                group
                                  { kind =
                                      Group.Kind.NonCapturing ([] : List Flag)
                                  , expr
                                  }
                          , concat = \(_ : List Regex@1) -> expr
                          }

                  in  expr Regex visitor
              )
              x
          )

in  concat
