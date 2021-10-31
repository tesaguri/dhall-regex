let Perl =
      ./core.dhall
        sha256:30656d109edb47060bc3575bcb49881378ebc10069df52f2eda6e8fd20e9b7c3

let word
    : Perl.Type
    = Perl::{ kind = Perl.Kind.Word }

in  word
