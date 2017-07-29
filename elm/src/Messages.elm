module Messages exposing (..)

-- import Phoenix.Socket

import Http
import Navigation
import Model exposing (..)
import Routing exposing (Route)


type Msg
    = FetchType (Result Http.Error TypeList)
    | CreateType (Result Http.Error Type)
    | DeleteType (Result Http.Error Type)
    | FetchBrand (Result Http.Error BrandList)
    | SetTypeName String
    | ClickSaveType
    | ClickDeleteType Int
    | UrlChange Navigation.Location
    | NavigateTo Route
