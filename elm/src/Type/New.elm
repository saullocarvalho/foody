module Type.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Type)
import Messages exposing (..)


typeNew : Type -> Html Msg
typeNew newType =
    div [ class "form-inline" ]
        [ div [ class "form-group" ]
            [ label
                [ class "sr-only"
                , attribute "for" "typeName"
                ]
                [ text "Name" ]
            , input
                [ class "form-control"
                , type_ "text"
                , id "typeName"
                , placeholder "Name"
                , onInput SetTypeName
                ]
                []
            ]
        , button
            [ onClick ClickCreateType
            , class "btn btn-primary"
            ]
            [ text "Create Type" ]
        ]
