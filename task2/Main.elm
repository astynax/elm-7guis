module Main exposing (main)

import Browser
import Html exposing (div, text, input)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)
import Maybe


main =
    Browser.sandbox
        { init = ("0", "0")
        , update = always
        , view = \(c, f) -> div []
          [ input [ value c, onInput (handle identity c2f) ] []
          , text " Celsius = "
          , input [ value f, onInput (handle f2c identity) ] []
          , text " Fahrenheits"
          ]
        }

handle f g x = Tuple.pair (f x) (g x)

c2f = try (\x -> x * 9 / 5 + 32)

f2c = try (\x -> (x - 32) * 5 / 9)

try f =
    Maybe.withDefault ""
    << Maybe.map (String.fromFloat << f)
    << String.toFloat
