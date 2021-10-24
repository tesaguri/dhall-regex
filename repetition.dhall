let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Visitor =
      ./Visitor.dhall
        sha256:0b8e712a07af019150944db041a61a65d399f743c18e91491595d1d3bce3e06b

let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let GroupKind =
      ./GroupKind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let Repetition =
      ./RepetitionType.dhall
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
