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
            updateCreateType model newType

        CreateType (Err error) ->
            model ! []

        DeleteType (Ok typeDeleted) ->
            updateDeleteType model typeDeleted

        DeleteType (Err error) ->
            model ! []

        SetTypeName typeName ->
            { model | typeName = typeName } ! []

        ClickSaveType ->
            let
                newType =
                    { id = 0
                    , name = model.typeName
                    }
            in
                { model | typeName = "" } ! [ createType newType ]

        ClickDeleteType typeId ->
            model ! [ deleteType typeId ]

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


updateCreateType : Model -> Type -> ( Model, Cmd Msg )
updateCreateType model newType =
    case model.typeList of
        Success oldTypeList ->
            let
                oldTypes =
                    oldTypeList.types

                newTypes =
                    List.sortBy .name (newType :: oldTypes)

                newTypeList =
                    { oldTypeList | types = newTypes }
            in
                { model | typeList = Success newTypeList } ! []

        _ ->
            model ! []


updateDeleteType : Model -> Type -> ( Model, Cmd Msg )
updateDeleteType model typeDeleted =
    case model.typeList of
        Success oldTypeList ->
            let
                oldTypes =
                    oldTypeList.types

                newTypes =
                    List.filter (\t -> t.id /= typeDeleted.id) oldTypes

                newTypeList =
                    { oldTypeList | types = newTypes }
            in
                { model | typeList = Success newTypeList } ! []

        _ ->
            model ! []



-- PhoenixMsg msg ->
--     let
--         ( phxSocket, phxCmd ) =
--             Phoenix.Socket.update msg model.phxSocket
--     in
--         { model | phxSocket = phxSocket } ! [ Cmd.map PhoenixMsg phxCmd ]
