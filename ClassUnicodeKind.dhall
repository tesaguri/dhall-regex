let ClassUnicodeOneLetter =
      ./ClassUnicodeOneLetter.dhall
        sha256:7a48c5fb27a0452e7ce73e356ae6dd52f3ce3e36072e6edfbff602411c0bfe3a

let ClassUnicodeNamedValue =
      ./ClassUnicodeNamedValue.dhall
        sha256:3e175410fd79df4a838b49415cf4290f6c46cf7890820539cc116d9822684864

let ClassUnicodeKind
    : Type
    = < OneLetter : ClassUnicodeOneLetter
      | Named : Text
      | NamedValue : ClassUnicodeNamedValue
      >

in  ClassUnicodeKind
