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

let GroupKind =
      ./Group/Kind.dhall
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
