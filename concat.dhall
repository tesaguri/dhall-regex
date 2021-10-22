let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let Group =
      ./GroupType.dhall
        sha256:0f262c2f20c4398ca7225db3c8571135e37cfce10b1a7f74f66977f8e28ea644

let GroupKind =
      ./GroupKind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

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
                  expr
                    Regex
                    ( visitor
                      with alternation =
                          ( \(xs : List Regex) ->
                              visitor.group
                                { kind = GroupKind.NonCapturing ([] : List Flag)
                                , expr = visitor.alternation xs
                                }
                          )
                    )
              )
              x
          )

in  concat
