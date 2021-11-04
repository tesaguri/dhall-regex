let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Regex/repetition =
      ./repetition.dhall
        sha256:b1af9424c92aeeb2f296ff162264ee195e4982b243e6fe79e041a47a7ab19fd1

let RepetitionKind =
      ./Repetition/Kind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let optional
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.ZeroOrOne, greedy = True, expr }

in  optional
