module Brand.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Brand)
import Messages exposing (Msg(..))


brandView : Brand -> Html Msg
brandView b =
    tr []
        [ td [] [ b.id |> toString |> text ]
        , td [] [ text b.name ]
        , td []
            [ div
                [ class "btn-toolbar pull-right"
                , attribute "role" "toolbar"
                ]
                [ button
                    [ type_ "button"
                    , class "btn btn-default btn-sm"
                    , attribute "arial-label" "Edit"
                    , onClick (ClickEditBrand b)
                    ]
                    [ span
                        [ class "glyphicon glyphicon-pencil"
                        , attribute "aria-hidden" "true"
                        ]
                        []
                    ]
                , button
                    [ type_ "button"
                    , class "btn btn-danger btn-sm"
                    , attribute "arial-label" "Delete"
                    , onClick (ClickDeleteBrand b.id)
                    ]
                    [ span
                        [ class "glyphicon glyphicon-trash"
                        , attribute "aria-hidden" "true"
                        ]
                        []
                    ]
                ]
            ]
        ]
