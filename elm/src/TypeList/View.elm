module TypeList.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Type.View exposing (typeView)
import Type.New exposing (typeNew)


typeListView : Model -> Html Msg
typeListView model =
    case model.typeList of
        Success typeList ->
            div []
                [ table [ class "table" ]
                    [ thead []
                        [ tr []
                            [ th [] [ text "Id" ]
                            , th [] [ text "Type" ]
                            ]
                        ]
                    , typeList.types
                        |> List.map typeView
                        |> tbody []
                    ]
                , typeNew model.typeName
                ]

        Failure error ->
            div
                [ class "alert alert-danger"
                , attribute "role" "alert"
                ]
                [ text error ]

        _ ->
            text ""
