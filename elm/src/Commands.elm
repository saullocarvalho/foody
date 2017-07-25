module Commands exposing (..)

import Decoders exposing (typeListDecoder)
import Http
import Messages exposing (Msg(..))


fetchTypes : Cmd Msg
fetchTypes =
    let
        apiUrl =
            "/api/types"

        request =
            Http.get apiUrl typeListDecoder
    in
        Http.send FetchType request
