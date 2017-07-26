module TypeList.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Type.View exposing (typeView)


typeListView : Model -> Html Msg
typeListView model =
    if List.length model.typeList.types > 0 then
        table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Type" ]
                    ]
                ]
            , model.typeList.types
                |> List.map typeView
                |> tbody []
            ]
    else
        (text "There is no types yet.")
