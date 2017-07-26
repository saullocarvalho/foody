module Navigation.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (Msg(..))
import Routing exposing (Route(..))


navigation : Html Msg
navigation =
    nav [ class "navbar navbar-default" ]
        [ div [ class "container-fluid" ]
            [ navigationHeader
            , navigationCollapse
            ]
        ]


navigationHeader : Html Msg
navigationHeader =
    div [ class "navbar-header" ]
        [ button
            [ type_ "button"
            , class "navbar-toggle collapsed"
            , attribute "data-toggle" "collapse"
            , attribute "data-target" "#navbar-collapse"
            , attribute "aria-expanded" "false"
            ]
            [ span [ class "sr-only" ] [ text "Toogle Navigation" ]
            , span [ class "icon-bar" ] []
            , span [ class "icon-bar" ] []
            , span [ class "icon-bar" ] []
            ]
        , a
            [ class "navbar-brand"
            , onClick <| NavigateTo HomeIndexRoute
            ]
            [ text "Foody" ]
        ]


navigationCollapse : Html Msg
navigationCollapse =
    div
        [ class "collapse navbar-collapse"
        , id "navbar-collapse"
        ]
        [ ul [ class "nav navbar-nav" ]
            [ li []
                [ a [] [ text "Storage" ]
                ]
            , li [ class "dropdown" ]
                [ a
                    [ class "dropdown-toggle"
                    , attribute "data-toggle" "dropdown"
                    , attribute "role" "button"
                    , attribute "aria-haspopup" "true"
                    , attribute "aria-expanded" "false"
                    ]
                    [ text "Manage"
                    , span [ class "caret" ] []
                    ]
                , ul [ class "dropdown-menu" ]
                    [ li []
                        [ a [ onClick <| NavigateTo TypeIndexRoute ]
                            [ text "Types" ]
                        ]
                    , li [] [ a [] [ text "Brands" ] ]
                    ]
                ]
            ]
        ]
