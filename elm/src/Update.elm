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

        UpdateType (Ok typeUpdated) ->
            updateUpdateType model typeUpdated

        UpdateType (Err error) ->
            model ! []

        DeleteType (Ok typeDeleted) ->
            updateDeleteType model typeDeleted

        DeleteType (Err error) ->
            model ! []

        SetTypeName typeName ->
            { model | typeName = typeName } ! []

        ClickSaveType ->
            saveType model

        ClickEditType typeToEdit ->
            { model | typeName = typeToEdit.name, typeId = Just typeToEdit.id } ! []

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


saveType : Model -> ( Model, Cmd Msg )
saveType model =
    case model.typeId of
        Just id ->
            let
                editedType =
                    { id = id
                    , name = model.typeName
                    }
            in
                { model | typeName = "", typeId = Nothing } ! [ updateType editedType ]

        Nothing ->
            let
                newType =
                    { id = 0
                    , name = model.typeName
                    }
            in
                { model | typeName = "" } ! [ createType newType ]


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


updateUpdateType : Model -> Type -> ( Model, Cmd Msg )
updateUpdateType model typeUpdated =
    case model.typeList of
        Success oldTypeList ->
            let
                oldTypes =
                    oldTypeList.types

                newTypes =
                    List.sortBy .name
                        (List.map
                            (\t ->
                                if t.id == typeUpdated.id then
                                    { t | name = typeUpdated.name }
                                else
                                    t
                            )
                            oldTypes
                        )

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
