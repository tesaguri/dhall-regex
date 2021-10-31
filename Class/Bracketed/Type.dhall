let Bracketed =
      ./MakeType.dhall
        sha256:c86e7dff4075f4346339e1c951bbf85dce42a0d5c08678c5b2e9e0a2723e07cc

let Set =
      ../Set/Type.dhall
        sha256:13becad51ab4cd5a2f3fc15882cb392a2cd9561e44f43fca944ce9cff063c0cd

let Bracketed = Bracketed Set

in  Bracketed
