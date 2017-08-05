module Product.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Model exposing (..)
import Settings exposing (settings)
import DatePicker exposing (view)


productForm : Model -> Html Msg
productForm ({ typeList, productTypeId, brandList, productBrandId, productExpiresAt, datePicker } as model) =
    case ( typeList, brandList ) of
        ( Success types, Success brands ) ->
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
                    , selectProductType productTypeId types
                    ]
                , div [ class "form-group" ]
                    [ label
                        [ class "sr-only"
                        , attribute "for" "productBrandId"
                        ]
                        [ text "Product Brand" ]
                    , selectProductBrand productBrandId brands
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

        _ ->
            text ""


selectProductType : Maybe Int -> TypeList -> Html Msg
selectProductType productTypeId ({ types } as typeList) =
    (option [] [ text "Choose Type" ] :: List.map typeOption types)
        |> select
            [ class "form-control"
            , id "productTypeId"
            , onInput SetProductType
            ]


typeOption : Type -> Html Msg
typeOption t =
    option [ value (toString t.id) ] [ text t.name ]


selectProductBrand : Maybe Int -> BrandList -> Html Msg
selectProductBrand productBrandId ({ brands } as brandList) =
    (option [] [ text "Choose Brand" ] :: List.map brandOption brands)
        |> select
            [ class "form-control"
            , id "productBrandId"
            , onInput SetProductBrand
            ]


brandOption : Brand -> Html Msg
brandOption b =
    option [ value (toString b.id) ] [ text b.name ]
