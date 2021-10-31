let PerlKind =
      ./Kind.dhall
        sha256:27d090eb9028e1b99cada2c6514a25563df7f7af110b53fe5b44cddef2aed2ce

let Perl
    : Type
    = { kind : PerlKind, negated : Bool }

in  Perl
