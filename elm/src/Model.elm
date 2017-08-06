module Model exposing (..)

import Routing exposing (Route)
import Date exposing (..)
import DatePicker exposing (..)


type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a


initialModel : Route -> DatePicker.DatePicker -> Model
initialModel route datePicker =
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
    , datePicker = datePicker
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
    , datePicker : DatePicker.DatePicker
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


type alias SendProduct =
    { typeId : Int
    , brandId : Int
    , expiresAt : String
    }


type alias ConsumeProduct =
    { typeId : Int
    , brandId : Int
    , expiresAt : String
    , consumed : Bool
    }


type alias Id =
    { id : Int }
