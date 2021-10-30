let Regex =
      ./Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Regex/repetition =
      ./repetition.dhall
        sha256:e88282670fe7d36783975882d9083cc4dd25fe890e99bf366985b5c91c652338

let RepetitionKind =
      ./RepetitionKind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let bounded
    : Natural -> Natural -> Regex -> Regex
    = \(start : Natural) ->
      \(end : Natural) ->
      \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.Bounded { start, end }, greedy = True, expr }

in  bounded
