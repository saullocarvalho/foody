module Update exposing (..)

import Phoenix.Socket
import Model exposing (..)
import Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PhoenixMsg msg ->
            let
                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.update msg model.phxSocket
            in
                { model | phxSocket = phxSocket } ! [ Cmd.map PhoenixMsg phxCmd ]
