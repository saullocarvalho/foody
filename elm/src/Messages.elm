module Messages exposing (..)

import Phoenix.Socket


type Msg
    = PhoenixMsg (Phoenix.Socket.Msg Msg)
