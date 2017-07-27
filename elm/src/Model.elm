module Model exposing (..)

import Routing exposing (Route)


-- import Phoenix.Socket
-- import Model exposing (Msg)
-- socketServer : String
-- socketServer =
--     "ws://localhost:4000/socket/websocket"
-- initPhxSocket : Phoenix.Socket.Socket Msg
-- initPhxSocket =
--     Phoenix.Socket.init socketServer
--         |> Phoenix.Socket.withDebug


type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a


initialNewType : Type
initialNewType =
    { id = 0
    , name = ""
    }


initialModel : Route -> Model
initialModel route =
    { typeList = NotRequested
    , brandList = NotRequested
    , newType = initialNewType

    -- , phxSocket = initPhxSocket
    , route = route
    }


type alias Model =
    { typeList : RemoteData String TypeList
    , newType : Type
    , brandList : RemoteData String BrandList

    -- , phxSocket : Phoenix.Socket.Socket Msg
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
