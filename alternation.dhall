let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Regex =
      ./Type.dhall
        sha256:f339404b3d7e4a112ceb9533482b4941c41b6ec9ae28840c913ee1983ac2a60c

let Visitor =
      ./Visitor.dhall
        sha256:f20605cfa3964e442fea3c091ca8c09a913103d093db56db43d7a815a206ca5e

let alternation
    : List Regex -> Regex
    = \(x : List Regex) ->
      \(Regex : Type) ->
      \(visitor : Visitor Regex) ->
        visitor.alternation
          (List/map Regex@1 Regex (\(expr : Regex@1) -> expr Regex visitor) x)

in  alternation
