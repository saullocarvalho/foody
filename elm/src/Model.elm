module Model exposing (..)

-- import Phoenix.Socket
-- import Model exposing (Msg)


socketServer : String
socketServer =
    "ws://localhost:4000/socket/websocket"



-- initPhxSocket : Phoenix.Socket.Socket Msg
-- initPhxSocket =
--     Phoenix.Socket.init socketServer
--         |> Phoenix.Socket.withDebug


initialTypeList : TypeList
initialTypeList =
    { types = [] }


initialModel : Model
initialModel =
    { typeList = initialTypeList

    -- , phxSocket = initPhxSocket
    , error = Nothing
    }


type alias Model =
    { typeList : TypeList

    -- , phxSocket : Phoenix.Socket.Socket Msg
    , error : Maybe String
    }


type alias TypeList =
    { types : List Type }


type alias Type =
    { id : Int
    , name : String
    }
