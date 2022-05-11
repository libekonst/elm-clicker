module TextFields exposing (..)

import Browser
import Debug
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    { content : String }


init : Model
init =
    { content = "" }



-- Update


type Msg
    = Change String
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

        Reset ->
            { model | content = "" } |> Debug.log "hello"



-- View


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
        , div [ getColor model.content ] [ text (getReverseOrPlaceholder model.content) ]
        , div [] [ text (getLengthText model.content) ]
        , button [ title "Reset", disabled (isDisabled model.content), onClick Reset ] [ text "Reset" ]
        ]



-- Functions


getLength : String -> String
getLength input =
    String.length input |> String.fromInt


getLengthText : String -> String
getLengthText input =
    "Input length: " ++ getLength input


hasInput : String -> Bool
hasInput input =
    input /= ""


getReverseOrPlaceholder : String -> String
getReverseOrPlaceholder input =
    if hasInput input then
        String.reverse input

    else
        "The reversed message will appear here..."


getColor : String -> Attribute Msg
getColor input =
    if hasInput input then
        style "color" "deeppink"

    else
        style "color" "gray"


isDisabled : String -> Bool
isDisabled input =
    hasInput input
        |> not
