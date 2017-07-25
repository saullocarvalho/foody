module View exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)
import TypeList.View exposing (typeListView)


view : Model -> Html Msg
view model =
    layout model


layout : Model -> Html Msg
layout model =
    div []
        [ header
        , typeListView model
        ]


header : Html Msg
header =
    h1 [] [ text "Foddy" ]
