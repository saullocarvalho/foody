module Brand.Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Brand.View exposing (brandView)
import Brand.Form exposing (brandForm)


brandIndex : Model -> Html Msg
brandIndex model =
    case model.brandList of
        Success brandList ->
            div []
                [ table [ class "table" ]
                    [ thead []
                        [ tr []
                            [ th [] [ text "Id" ]
                            , th [] [ text "Brand" ]
                            , th [] []
                            ]
                        ]
                    , brandList.brands
                        |> List.map brandView
                        |> tbody []
                    ]
                , brandForm model.brandName
                ]

        Failure error ->
            div
                [ class "alert alert-danger"
                , attribute "role" "alert"
                ]
                [ text error ]

        _ ->
            text ""
