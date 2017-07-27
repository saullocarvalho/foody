module Update exposing (..)

-- import Phoenix.Socket

import Navigation
import Model exposing (..)
import Messages exposing (..)
import Commands exposing (..)
import Routing exposing (Route(..), parse, toPath)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchType (Ok typeList) ->
            { model | typeList = Success typeList } ! []

        FetchType (Err error) ->
            { model | typeList = Failure "Something went wrong..." } ! []

        CreateType (Ok newType) ->
            model ! []

        CreateType (Err error) ->
            model ! []

        SetTypeName typeName ->
            let
                oldType =
                    model.newType

                newType =
                    { oldType | name = typeName }
            in
                { model | newType = newType } ! []

        ClickCreateType ->
            model ! [ createType model.newType ]

        FetchBrand (Ok brandList) ->
            { model | brandList = Success brandList } ! []

        FetchBrand (Err error) ->
            { model | brandList = Failure "Something went wrong..." } ! []

        UrlChange location ->
            let
                currentRoute =
                    parse location
            in
                urlUpdate { model | route = currentRoute }

        NavigateTo route ->
            model ! [ Navigation.newUrl <| toPath route ]


urlUpdate : Model -> ( Model, Cmd Msg )
urlUpdate model =
    case model.route of
        HomeIndexRoute ->
            model ! []

        TypeIndexRoute ->
            model ! [ fetchTypes ]

        BrandIndexRoute ->
            model ! [ fetchBrands ]

        _ ->
            model ! []



-- PhoenixMsg msg ->
--     let
--         ( phxSocket, phxCmd ) =
--             Phoenix.Socket.update msg model.phxSocket
--     in
--         { model | phxSocket = phxSocket } ! [ Cmd.map PhoenixMsg phxCmd ]
