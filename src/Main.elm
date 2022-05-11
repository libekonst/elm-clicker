module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- import Html.Attributes exposing (disabled)
-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    Int


init : Model
init =
    0



-- Update


type Message
    = Increment
    | Decrement
    | IncDecimal
    | DecDecimal
    | Reset


update : Message -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        IncDecimal ->
            model + 10

        DecDecimal ->
            model - 10

        Reset ->
            0



-- View


view : Model -> Html Message
view model =
    div []
        [ button [ onClick Decrement ] [ text "-1" ]
        , button [ onClick DecDecimal ] [ text "-10" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+1" ]
        , button [ onClick IncDecimal ] [ text "+10" ]
        , if hasCounted model then
            button [ onClick Reset ] [ text "Reset" ]

          else
            text ""
        ]



-- Selectors


hasCounted : Model -> Bool
hasCounted model =
    model /= 0
