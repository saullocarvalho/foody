module Messages exposing (..)

-- import Phoenix.Socket

import Http
import Navigation
import Model exposing (TypeList, BrandList)
import Routing exposing (Route)


type Msg
    = FetchType (Result Http.Error TypeList)
    | FetchBrand (Result Http.Error BrandList)
    | UrlChange Navigation.Location
    | NavigateTo Route
