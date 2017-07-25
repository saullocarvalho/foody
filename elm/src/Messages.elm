module Messages exposing (..)

-- import Phoenix.Socket

import Http
import Model exposing (TypeList)


type Msg
    = FetchType (Result Http.Error TypeList)
