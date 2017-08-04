module Model exposing (..)

import Routing exposing (Route)
import Date exposing (..)


type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a


initialModel : Route -> Model
initialModel route =
    { typeList = NotRequested
    , typeName = ""
    , typeId = Nothing
    , brandList = NotRequested
    , brandName = ""
    , brandId = Nothing
    , productList = NotRequested
    , productBrandId = Nothing
    , productTypeId = Nothing
    , productExpiresAt = Nothing
    , route = route
    }


type alias Model =
    { typeList : RemoteData String TypeList
    , typeName : String
    , typeId : Maybe Int
    , brandList : RemoteData String BrandList
    , brandName : String
    , brandId : Maybe Int
    , productList : RemoteData String ProductList
    , productBrandId : Maybe Int
    , productTypeId : Maybe Int
    , productExpiresAt : Maybe Date
    , route : Route
    }


type alias TypeList =
    { types : List Type }


type alias Type =
    { id : Int
    , name : String
    }


type alias BrandList =
    { brands : List Brand }


type alias Brand =
    { id : Int
    , name : String
    }


type alias ProductList =
    { products : List Product }


type alias Product =
    { productType : Type
    , productBrand : Brand
    , count : Int
    , expiresAt : Date
    }


type alias Id =
    { id : Int }
