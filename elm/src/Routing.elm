module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type Route
    = HomeIndexRoute
    | TypeIndexRoute
    | BrandIndexRoute
    | ProductIndexRoute
    | StorageRoute
    | NotFoundRoute


toPath : Route -> String
toPath route =
    case route of
        HomeIndexRoute ->
            "/"

        TypeIndexRoute ->
            "/types"

        BrandIndexRoute ->
            "/brands"

        ProductIndexRoute ->
            "/products"

        StorageRoute ->
            "/storage"

        NotFoundRoute ->
            "/not-found"


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeIndexRoute <| s ""
        , map TypeIndexRoute <| s "types"
        , map BrandIndexRoute <| s "brands"
        , map ProductIndexRoute <| s "products"
        , map StorageRoute <| s "storage"
        ]


parse : Navigation.Location -> Route
parse location =
    case UrlParser.parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
