let Flag =
      ./Flag.dhall
        sha256:0264af3ae814901e53d13075789c1c6d745909e4701e17b898564a0e3e84439a

let GroupKind = < CaptureIndex | CaptureName : Text | NonCapturing : List Flag >

in  GroupKind
