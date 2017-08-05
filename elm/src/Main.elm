module Main exposing (..)

import Navigation
import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Messages exposing (Msg(..))
import Routing exposing (parse)
import DatePicker exposing (init)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parse location

        ( datePicker, datePickerFx ) =
            DatePicker.init

        model =
            initialModel currentRoute datePicker
    in
        urlUpdate model


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = always <| Sub.none
        }
