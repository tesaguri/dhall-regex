let Regex = ./Type.dhall

let Visitor = ./Visitor.dhall

let Flag = ./Flag.dhall

let GroupKind = ./GroupKind.dhall

let Repetition = ./RepetitionType.dhall

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
