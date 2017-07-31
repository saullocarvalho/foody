module Model exposing (..)

import Routing exposing (Route)


type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a


initialModel : Route -> Model
initialModel route =
    { typeList = NotRequested
    , brandList = NotRequested
    , typeName = ""
    , typeId = Nothing
    , route = route
    }


type alias Model =
    { typeList : RemoteData String TypeList
    , typeName : String
    , typeId : Maybe Int
    , brandList : RemoteData String BrandList
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


type alias Id =
    { id : Int }
