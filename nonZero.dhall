let Regex =
      ./Type.dhall
        sha256:334439f6154ad39c69e4161a595fcf3ad8757c67f63445455d9e6e67e79a9ca6

let Regex/repetition =
      ./repetition.dhall
        sha256:cd2c2569d2a58d77cccaf192799d258199d505728dd34730e231c245497d2d85

let RepetitionKind =
      ./RepetitionKind.dhall
        sha256:29fbd6d7c43327c0c95f42751b376c92ff93185c599ab7a278b6478f5c46e580

let nonZero
    : Regex -> Regex
    = \(expr : Regex) ->
        Regex/repetition
          { kind = RepetitionKind.OneOrMore, greedy = True, expr }

in  nonZero
