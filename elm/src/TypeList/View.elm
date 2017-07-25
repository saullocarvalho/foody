module TypeList.View exposing (..)

import Html exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Type.View exposing (typeView)


typeListView : Model -> Html Msg
typeListView model =
    if List.length model.typeList.types > 0 then
        model.typeList.types
            |> List.map typeView
            |> ul []
    else
        (text "There is no types yet.")
