let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Regex/repetition =
      ./repetition.dhall
        sha256:2d6fe090ff38c31fb05b5cd8ff56d98a007b374542142c9ee827f2af7970939f

let RepetitionKind =
      ./RepetitionKind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let exactly
    : Natural -> Regex -> Regex
    = \(n : Natural) ->
      \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.Exactly n, greedy = True, expr }

in  exactly
