let Regex =
      ../Type.dhall
        sha256:9918b75f0d25c33dfeae6983e4db668b548899cbd42d062297eeb5068647accb

let Repetition =
      ./MakeType.dhall
        sha256:c0f41cb47504d6d5fb9f34d93a9c731f3c08e3efc704867af30f9155c7942a24

let Repetition = Repetition Regex

in  Repetition
