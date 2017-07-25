module Subscriptions exposing (..)

import Phoenix.Socket
import Model exposing (..)
import Messages exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Phoenix.Socket.listen model.phxSocket PhoenixMsg
