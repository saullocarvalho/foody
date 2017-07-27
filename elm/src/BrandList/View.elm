module BrandList.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Brand.View exposing (brandView)


brandListView : Model -> Html Msg
brandListView model =
    case model.brandList of
        Success brandList ->
            table [ class "table" ]
                [ thead []
                    [ tr []
                        [ th [] [ text "Id" ]
                        , th [] [ text "Brand" ]
                        ]
                    ]
                , brandList.brands
                    |> List.map brandView
                    |> tbody []
                ]

        Failure error ->
            div
                [ class "alert alert-danger"
                , attribute "role" "alert"
                ]
                [ text error ]

        _ ->
            text ""
