module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Messages exposing (Msg(..))
import Subscriptions exposing (..)


init : ( Model, Cmd Msg )
init =
    initialModel ! []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
