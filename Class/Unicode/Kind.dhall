let OneLetter =
      ./OneLetter.dhall
        sha256:7a48c5fb27a0452e7ce73e356ae6dd52f3ce3e36072e6edfbff602411c0bfe3a

let NamedValue =
      ./NamedValue.dhall
        sha256:3e175410fd79df4a838b49415cf4290f6c46cf7890820539cc116d9822684864

let UnicodeKind
    : Type
    = < OneLetter : OneLetter | Named : Text | NamedValue : NamedValue >

in  UnicodeKind
