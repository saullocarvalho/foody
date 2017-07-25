module Model exposing (..)

import Phoenix.Socket
import Messages exposing (..)


socketServer : String
socketServer =
    "ws://localhost:4000/socket/websocket"


type alias Model =
    { phxSocket : Phoenix.Socket.Socket Msg }


initPhxSocket : Phoenix.Socket.Socket Msg
initPhxSocket =
    Phoenix.Socket.init socketServer
        |> Phoenix.Socket.withDebug


initialModel : Model
initialModel =
    { phxSocket = initPhxSocket }
