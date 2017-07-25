module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)
import TypeList.View exposing (typeListView)


view : Model -> Html Msg
view model =
    layout model


layout : Model -> Html Msg
layout model =
    div []
        [ navigation
        , typeListView model
        ]


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
            , href "/"
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
                    [ href "#"
                    , class "dropdown-toggle"
                    , attribute "data-toggle" "dropdown"
                    , attribute "role" "button"
                    , attribute "aria-haspopup" "true"
                    , attribute "aria-expanded" "false"
                    ]
                    [ text "Manage"
                    , span [ class "caret" ] []
                    ]
                , ul [ class "dropdown-menu" ]
                    [ li [] [ a [ href "#" ] [ text "Types" ] ]
                    , li [] [ a [ href "#" ] [ text "Brands" ] ]
                    ]
                ]
            ]
        ]
