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


initialModel : Route -> Model
initialModel route =
    { typeList = NotRequested

    -- , phxSocket = initPhxSocket
    , route = route
    }


type alias Model =
    { typeList : RemoteData String TypeList

    -- , phxSocket : Phoenix.Socket.Socket Msg
    , route : Route
    }


type alias TypeList =
    { types : List Type }


type alias Type =
    { id : Int
    , name : String
    }
