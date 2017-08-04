module View exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)
import Home.View exposing (homeView)
import Type.Index exposing (typeIndex)
import Brand.Index exposing (brandIndex)
import Product.Index exposing (productIndex)
import Navigation.View exposing (navigation)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    layout model


layout : Model -> Html Msg
layout model =
    div []
        [ navigation
        , page model
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

        NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    text "Route not found"
