module Product.Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Product.View exposing (productView)


productIndex : Model -> Html Msg
productIndex model =
    case model.productList of
        Success productList ->
            div []
                [ table [ class "table" ]
                    [ thead []
                        [ tr []
                            [ th [] [ text "Brand" ]
                            , th [] [ text "Type" ]
                            , th [] [ text "Expires At" ]
                            , th [] [ text "Count" ]
                            , th [] []
                            ]
                        ]
                    , productList.products
                        |> List.map productView
                        |> tbody []
                    ]

                -- , typeForm model.typeName
                ]

        Failure error ->
            div
                [ class "alert alert-danger"
                , attribute "role" "alert"
                ]
                [ text error ]

        _ ->
            text ""
