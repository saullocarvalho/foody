module Messages exposing (..)

-- import Phoenix.Socket

import Http
import Navigation
import Model exposing (TypeList)
import Routing exposing (Route)


type Msg
    = FetchType (Result Http.Error TypeList)
    | UrlChange Navigation.Location
    | NavigateTo Route
