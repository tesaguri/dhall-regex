let UnicodeKind =
      ./Kind.dhall
        sha256:3e5e3dbdfe5c93b8f5d40df8df3717d5facb4af00ed2f70ff7a98f8669ac9405

let Unicode
    : Type
    = { kind : UnicodeKind, negated : Bool }

in  Unicode
