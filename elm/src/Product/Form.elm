module Product.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Messages exposing (..)
import Model exposing (..)
import Settings exposing (settings)
import DatePicker exposing (view)


productForm : Model -> Html Msg
productForm ({ productTypeId, productBrandId, productExpiresAt, datePicker } as model) =
    Html.form
        [ class "form-inline"

        -- , onSubmit ClickSaveProduct
        ]
        [ div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "productTypeId"
                ]
                [ text "Product Type" ]
            , selectProductType model.productTypeId
            ]
        , div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "productBrandId"
                ]
                [ text "Product Brand" ]
            , selectProductBrand productBrandId
            ]
        , div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "productExpiresAt"
                ]
                [ text "Product Expiration Date" ]
            , DatePicker.view productExpiresAt settings datePicker
                |> Html.map ToDatePicker
            ]
        , button
            [ type_ "submit"
            , class "btn btn-primary"
            ]
            [ span
                [ class "glyphicon glyphicon-plus"
                , attribute "aria-hidden" "true"
                ]
                []
            ]
        ]


selectProductType : Maybe Int -> Html Msg
selectProductType productTypeId =
    select
        [ class "form-control"
        , id "productTypeId"

        -- , onInput SetTypeName
        -- , value typeName
        ]
        [ option [] [ text "Choose Type" ]
        ]


selectProductBrand : Maybe Int -> Html Msg
selectProductBrand productBrandId =
    select
        [ class "form-control"
        , id "productBrandId"
        ]
        [ option [] [ text "Choose Brand" ]
        ]
