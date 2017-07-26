module Main exposing (..)

import Navigation
import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Messages exposing (Msg(..))
import Routing exposing (parse)


-- import Subscriptions exposing (..)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parse location

        model =
            initialModel currentRoute
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
