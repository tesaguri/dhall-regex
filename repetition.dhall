let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Visitor =
      ./Visitor.dhall
        sha256:b5ab043896707928bc9caff0c95ec3788cfea564358f5251ac6f186a6d7085cc

let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let GroupKind =
      ./Group/Kind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let Repetition =
      ./Repetition/Type.dhall
        sha256:c0f41cb47504d6d5fb9f34d93a9c731f3c08e3efc704867af30f9155c7942a24

let repetition
    : Repetition Regex -> Regex
    = \(x : Repetition Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        let expr =
              x.expr
                Regex
                ( visitor
                  with literal =
                      ( \(x : Text) ->
                          visitor.group
                            { kind = GroupKind.NonCapturing ([] : List Flag)
                            , expr = visitor.literal x
                            }
                      )
                  with alternation =
                      ( \(xs : List Regex) ->
                          visitor.group
                            { kind = GroupKind.NonCapturing ([] : List Flag)
                            , expr = visitor.alternation xs
                            }
                      )
                  with concat =
                      ( \(xs : List Regex) ->
                          visitor.group
                            { kind = GroupKind.NonCapturing ([] : List Flag)
                            , expr = visitor.concat xs
                            }
                      )
                )

        in  visitor.repetition (x // { expr })

in  repetition
