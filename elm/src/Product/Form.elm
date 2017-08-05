module Product.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Messages exposing (..)
import Date exposing (..)


productForm : Maybe Int -> Maybe Int -> Maybe Date -> Html Msg
productForm productBrandId productTypeId productExpiresAt =
    Html.form
        [ class "form-inline"

        -- , onSubmit ClickSaveProduct
        ]
        [ div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "typeName"
                ]
                [ text "Name" ]
            , select
                [ class "form-control"
                , id "productTypeId"
                , placeholder "Choose Type"

                -- , onInput SetTypeName
                -- , value typeName
                ]
                []
            ]
        , button
            [ type_ "submit"
            , class "btn btn-primary"
            ]
            [ text "Save Product" ]
        ]
