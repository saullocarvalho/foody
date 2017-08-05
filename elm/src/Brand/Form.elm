module Brand.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)


brandForm : String -> Html Msg
brandForm brandName =
    Html.form
        [ class "form-inline"
        , onSubmit ClickSaveBrand
        ]
        [ div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "brandName"
                ]
                [ text "Name" ]
            , input
                [ class "form-control"
                , type_ "text"
                , id "brandName"
                , placeholder "Add/Edit a Brand"
                , onInput SetBrandName
                , value brandName
                ]
                []
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
