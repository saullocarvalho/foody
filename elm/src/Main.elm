module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Messages exposing (Msg(..))
import Commands exposing (..)


-- import Subscriptions exposing (..)


init : ( Model, Cmd Msg )
init =
    initialModel ! [ fetchTypes ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = always <| Sub.none
        }
