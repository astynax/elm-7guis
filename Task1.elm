module Main exposing (main)

import Browser
import Html exposing (div, input, button, text)
import Html.Attributes exposing (value, readonly)
import Html.Events exposing (onClick)
import Maybe


main =
    Browser.sandbox
        { init = 0
        , update = always
        , view = \v -> div []
          [ input [ value <| String.fromInt v, readonly True ] []
          , button [ onClick (v + 1) ] [ text "Count" ]
          ]
        }
