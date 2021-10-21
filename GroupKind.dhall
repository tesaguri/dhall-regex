let Flag = ./Flag.dhall

let GroupKind = < CaptureIndex | CaptureName : Text | NonCapturing : List Flag >

in  GroupKind
