module Update exposing (..)

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

        CreateType (Ok typeCreated) ->
            updateCreateType model typeCreated

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

        CreateBrand (Ok brandCreated) ->
            updateCreateBrand model brandCreated

        CreateBrand (Err error) ->
            model ! []

        UpdateBrand (Ok brandUpdated) ->
            updateUpdateBrand model brandUpdated

        UpdateBrand (Err error) ->
            model ! []

        DeleteBrand (Ok brandDeleted) ->
            updateDeleteBrand model brandDeleted

        DeleteBrand (Err error) ->
            model ! []

        SetBrandName brandName ->
            { model | brandName = brandName } ! []

        ClickSaveBrand ->
            saveBrand model

        ClickEditBrand brandToEdit ->
            { model | brandName = brandToEdit.name, brandId = Just brandToEdit.id } ! []

        ClickDeleteBrand brandId ->
            model ! [ deleteBrand brandId ]

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


saveBrand : Model -> ( Model, Cmd Msg )
saveBrand model =
    case model.brandId of
        Just id ->
            let
                editedBrand =
                    { id = id
                    , name = model.brandName
                    }
            in
                { model | brandName = "", brandId = Nothing } ! [ updateBrand editedBrand ]

        Nothing ->
            let
                newBrand =
                    { id = 0
                    , name = model.brandName
                    }
            in
                { model | brandName = "" } ! [ createBrand newBrand ]


updateCreateType : Model -> Type -> ( Model, Cmd Msg )
updateCreateType model typeCreated =
    case model.typeList of
        Success oldTypeList ->
            let
                oldTypes =
                    oldTypeList.types

                newTypes =
                    List.sortBy .name (typeCreated :: oldTypes)

                newTypeList =
                    { oldTypeList | types = newTypes }
            in
                { model | typeList = Success newTypeList } ! []

        _ ->
            model ! []


updateCreateBrand : Model -> Brand -> ( Model, Cmd Msg )
updateCreateBrand model brandCreated =
    case model.brandList of
        Success oldBrandList ->
            let
                oldBrands =
                    oldBrandList.brands

                newBrands =
                    List.sortBy .name (brandCreated :: oldBrands)

                newBrandList =
                    { oldBrandList | brands = newBrands }
            in
                { model | brandList = Success newBrandList } ! []

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


updateUpdateBrand : Model -> Brand -> ( Model, Cmd Msg )
updateUpdateBrand model brandUpdated =
    case model.brandList of
        Success oldBrandList ->
            let
                oldBrands =
                    oldBrandList.brands

                newBrands =
                    List.sortBy .name
                        (List.map
                            (\b ->
                                if b.id == brandUpdated.id then
                                    { b | name = brandUpdated.name }
                                else
                                    b
                            )
                            oldBrands
                        )

                newBrandList =
                    { oldBrandList | brands = newBrands }
            in
                { model | brandList = Success newBrandList } ! []

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


updateDeleteBrand : Model -> Brand -> ( Model, Cmd Msg )
updateDeleteBrand model brandDeleted =
    case model.brandList of
        Success oldBrandList ->
            let
                oldBrands =
                    oldBrandList.brands

                newBrands =
                    List.filter (\b -> b.id /= brandDeleted.id) oldBrands

                newBrandList =
                    { oldBrandList | brands = newBrands }
            in
                { model | brandList = Success newBrandList } ! []

        _ ->
            model ! []
