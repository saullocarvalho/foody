module Storage.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (..)
import Storage.Item exposing (storageItem)


storageList : Model -> Html Msg
storageList ({ productList, today } as model) =
    case ( productList, today ) of
        ( Success productList, Just today ) ->
            div []
                [ table [ class "table" ]
                    [ thead []
                        [ tr []
                            [ th [] [ text "Brand" ]
                            , th [] [ text "Type" ]
                            , th [] [ text "Expires At" ]
                            , th [] [ text "Count" ]
                            ]
                        ]
                    , productList.products
                        |> List.map (storageItem today)
                        |> tbody []
                    ]
                ]

        ( Failure error, _ ) ->
            div
                [ class "alert alert-danger"
                , attribute "role" "alert"
                ]
                [ text error ]

        _ ->
            text ""
