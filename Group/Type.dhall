let GroupKind =
      ./Kind.dhall
        sha256:efab2d6bd02158af1ee7ff6b1320e2387f3e876f8d5e3ee6e741f1292a4387fc

let Group
    : forall (Regex : Type) -> Type
    = \(Regex : Type) -> { kind : GroupKind, expr : Regex }

in  Group
