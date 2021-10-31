let Regex =
      ../Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Repetition =
      ./core.dhall
        sha256:429e2551f81165c308982c2f3a3be402edbf9f55d460cd67aaaedfb397d82fd7

let zeroOrMore
    : Regex -> Repetition.Type
    = \(expr : Regex) -> Repetition::{ kind = Repetition.Kind.ZeroOrMore, expr }

in  zeroOrMore
