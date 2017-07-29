module Type.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Type)
import Messages exposing (Msg(..))


typeView : Type -> Html Msg
typeView t =
    tr []
        [ td [] [ t.id |> toString |> text ]
        , td [] [ text t.name ]
        , td []
            [ div
                [ class "btn-toolbar"
                , attribute "role" "toolbar"
                ]
                [ button
                    [ type_ "button"
                    , class "btn btn-danger btn-sm"
                    , attribute "arial-label" "Delete"
                    , onClick (ClickDeleteType t.id)
                    ]
                    [ span
                        [ class "glyphicon glyphicon-trash"
                        , attribute "aria-hidden" "true"
                        ]
                        []
                    ]
                , button
                    [ type_ "button"
                    , class "btn btn-default btn-sm"
                    , attribute "arial-label" "Edit"
                    ]
                    [ span
                        [ class "glyphicon glyphicon-pencil"
                        , attribute "aria-hidden" "true"
                        ]
                        []
                    ]
                ]
            ]
        ]
