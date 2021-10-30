let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Text/concatSep =
      https://prelude.dhall-lang.org/v21.0.0/Text/concatSep.dhall
        sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Text/concat =
      https://prelude.dhall-lang.org/v21.0.0/Text/concat.dhall
        sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

let Regex =
      ./core.dhall
        sha256:05406d966da8607d5ccca9e04d888d60baaed2c5633fb5269cecbc6c1a5cebd9

let escape
    : Text -> Text
    =
      -- Reference: <https://docs.rs/regex-syntax/0.6.25/regex_syntax/fn.is_meta_character.html>
      -- `"\\"` must be the final element. Otherwise, it would result in double-escaping.
      List/fold
        Text
        [ "."
        , "+"
        , "*"
        , "?"
        , "("
        , ")"
        , ","
        , "["
        , "]"
        , "{"
        , "}"
        , "^"
        , "\$"
        , "#"
        , "&"
        , "-"
        , "~"
        , "\\"
        ]
        Text
        (\(char : Text) -> Text/replace char "\\${char}")

let Flag/show
    : Regex.Flag -> Text
    = \(flag : Regex.Flag) ->
        merge
          { Negation = "-"
          , CaseInsensitive = "i"
          , MultiLine = "m"
          , DotMatchesNewLine = "s"
          , SwapGreed = "U"
          , Unicode = "u"
          , IgnoreWhitespace = "x"
          }
          flag

let Assertion/show
    : Regex.Assertion -> Text
    = \(assertion : Regex.Assertion) ->
        merge
          { StartLine = "^"
          , EndLine = "\$"
          , StartText = "\\A"
          , EndText = "\\z"
          , WordBoundary = "\\b"
          , NotWordBoundary = "\\B"
          }
          assertion

let ClassUnicode/show
    : Regex.ClassUnicode -> Text
    = \(x : Regex.ClassUnicode) ->
        let p = if x.negated then "P" else "p"

        let body =
              merge
                { OneLetter =
                    \(x : Regex.ClassUnicodeOneLetter) ->
                      merge
                        { Letter = "L"
                        , Punctuation = "P"
                        , Symbol = "S"
                        , Mark = "M"
                        , Number = "N"
                        , Separator = "Z"
                        , Other = "C"
                        }
                        x
                , Named = \(x : Text) -> "{${escape x}}"
                , NamedValue =
                    \(x : Regex.ClassUnicodeNamedValue) ->
                      let op =
                            merge
                              { Equal = "=", Colon = ":", NotEqual = "!=" }
                              x.op

                      in  "{${escape x.name}${op}${escape x.value}}"
                }
                x.kind

        in  "\\${p}${body}"

let ClassAscii/show =
      \(x : Regex.ClassAscii) ->
        let negation = if x.negated then "^" else ""

        let name =
              merge
                { Alnum = "alnum"
                , Alpha = "alpha"
                , Ascii = "ascii"
                , Blank = "blank"
                , Cntrl = "cntrl"
                , Digit = "digit"
                , Graph = "graph"
                , Lower = "lower"
                , Print = "print"
                , Punct = "punct"
                , Space = "space"
                , Upper = "upper"
                , Word = "word"
                , Xdigit = "xdigit"
                }
                x.kind

        in  "[:${negation}${name}:]"

let ClassPerl/show
    : Regex.ClassPerl -> Text
    = \(x : Regex.ClassPerl) ->
        if    x.negated
        then  merge { Digit = "\\D", Space = "\\S", Word = "\\W" } x.kind
        else  merge { Digit = "\\d", Space = "\\s", Word = "\\w" } x.kind

let ClassBracketed/show
    : Regex.ClassBracketed Text -> Text
    = \(x : Regex.ClassBracketed Text) ->
        let negation = if x.negated then "^" else "" in "[${negation}${x.kind}]"

let ClassSetBinaryOpKind/show
    : Regex.ClassSet.BinaryOpKind -> Text
    = \(x : Regex.ClassSet.BinaryOpKind) ->
        merge
          { Intersection = "&&", Difference = "--", SymmetricDifference = "~~" }
          x

let ClassSetBinaryOp/show
    : { op : Regex.ClassSet.BinaryOpKind, lhs : Text, rhs : Text } -> Text
    = \(x : { op : Regex.ClassSet.BinaryOpKind, lhs : Text, rhs : Text }) ->
        "${x.lhs}${ClassSetBinaryOpKind/show x.op}${x.rhs}"

let ClassSet/show
    : Regex.ClassSet.Type -> Text
    = \(x : Regex.ClassSet.Type) ->
        x
          Text
          Text
          { item = \(x : Text) -> x, binaryOp = ClassSetBinaryOp/show }
          { empty = ""
          , literal = escape
          , range =
              \(x : { start : Text, end : Text }) ->
                "${escape x.start}-${escape x.end}"
          , ascii = ClassAscii/show
          , unicode = ClassUnicode/show
          , perl = ClassPerl/show
          , bracketed = ClassBracketed/show
          , union = Text/concat
          }

let ClassBracketed/show
    : Regex.ClassBracketed Regex.ClassSet.Type -> Text
    = \(x : Regex.ClassBracketed Regex.ClassSet.Type) ->
        ClassBracketed/show (x with kind = ClassSet/show x.kind)

let Class/show
    : Regex.Class -> Text
    = \(class : Regex.Class) ->
        merge
          { Unicode = ClassUnicode/show
          , Perl = ClassPerl/show
          , Bracketed = ClassBracketed/show
          }
          class

let RepetitionKind/show
    : Regex.RepetitionKind -> Text
    = \(kind : Regex.RepetitionKind) ->
        merge
          { ZeroOrOne = "?"
          , ZeroOrMore = "*"
          , OneOrMore = "+"
          , Exactly = \(n : Natural) -> "{${Natural/show n}}"
          , AtLeast = \(n : Natural) -> "{${Natural/show n},}"
          , Bounded =
              \(range : { start : Natural, end : Natural }) ->
                "{${Natural/show range.start},${Natural/show range.end}}"
          }
          kind

let GroupKind/show
    : Regex.GroupKind -> Text
    = \(kind : Regex.GroupKind) ->
        merge
          { CaptureIndex = ""
          , CaptureName = \(name : Text) -> "?P<${name}>"
          , NonCapturing =
              \(flags : List Regex.Flag) ->
                "?${Text/concat (List/map Regex.Flag Text Flag/show flags)}:"
          }
          kind

let render
    : Regex.Type -> Text
    = \(expr : Regex.Type) ->
        expr
          Text
          { empty = ""
          , flags =
              \(xs : List Regex.Flag) ->
                "(?${Text/concat (List/map Regex.Flag Text Flag/show xs)})"
          , literal = escape
          , dot = "."
          , assertion = Assertion/show
          , class = Class/show
          , repetition =
              \(x : Regex.Repetition Text) ->
                let greediness = if x.greedy then "" else "?"

                in  "${x.expr}${RepetitionKind/show x.kind}${greediness}"
          , group =
              \(x : Regex.Group Text) -> "(${GroupKind/show x.kind}${x.expr})"
          , alternation = Text/concatSep "|"
          , concat = Text/concat
          }

let example0 =
      let ast = Regex.alternation [ Regex.literal "foo", Regex.literal "bar" ]

      in  assert : render ast === "foo|bar"

let example1 =
    -- Literal strings are escaped.
      let ast = Regex.literal "https://example.com/?q=foo+bar"

      in  assert : render ast === "https://example\\.com/\\?q=foo\\+bar"

let example2 =
    -- The `Regex.concat` and `Regex.repetition` constructors insert non-capturing groups
    -- when operator precedence is ambiguous.
      let ast =
            Regex.concat
              [ Regex.alternation [ Regex.literal "foo", Regex.literal "bar" ]
              , Regex.optional (Regex.literal "baz")
              ]

      in  assert : render ast === "(?:foo|bar)(?:baz)?"

let example3 =
      let lhs =
            Regex.ClassSet.item
              ( Regex.ClassSet.Item.unicode
                  { negated = False
                  , kind =
                      Regex.ClassUnicodeKind.OneLetter
                        Regex.ClassUnicodeOneLetter.Letter
                  }
              )

      let rhs =
            Regex.ClassSet.item
              ( Regex.ClassSet.Item.ascii
                  { negated = False, kind = Regex.ClassAsciiKind.Alnum }
              )

      let ast =
            Regex.class
              ( Regex.Class.Bracketed
                  { negated = False
                  , kind =
                      Regex.ClassSet.binaryOp
                        lhs
                        Regex.ClassSet.BinaryOpKind.Difference
                        rhs
                  }
              )

      in  assert : render ast === "[\\pL--[:alnum:]]"

in  render
