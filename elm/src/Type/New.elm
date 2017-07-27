module Type.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Type)
import Messages exposing (..)


typeNew : String -> Html Msg
typeNew typeName =
    Html.form
        [ class "form-inline"
        , onSubmit ClickSaveType
        ]
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
                , placeholder "Add/Edit a Type"
                , onInput SetTypeName
                , value typeName
                ]
                []
            ]
        , button
            [ type_ "submit"
            , class "btn btn-primary"
            ]
            [ text "Save Type" ]
        ]
