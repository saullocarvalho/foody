module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)
import Home.View exposing (homeView)
import Type.Index exposing (typeIndex)
import Brand.Index exposing (brandIndex)
import Product.Index exposing (productIndex)
import Navigation.View exposing (navigation)
import Storage.List exposing (storageList)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    layout model


layout : Model -> Html Msg
layout model =
    div []
        [ navigation
        , div [ class "row" ]
            [ div [ class "col-sm-10 col-sm-offset-1" ]
                [ page model ]
            ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeIndexRoute ->
            homeView

        TypeIndexRoute ->
            typeIndex model

        BrandIndexRoute ->
            brandIndex model

        ProductIndexRoute ->
            productIndex model

        StorageRoute ->
            storageList model

        NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    text "Route not found"
