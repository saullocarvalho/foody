module Commands exposing (..)

import Decoders exposing (typeListDecoder, brandListDecoder)
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


fetchBrands : Cmd Msg
fetchBrands =
    let
        apiUrl =
            "/api/brands"

        request =
            Http.get apiUrl brandListDecoder
    in
        Http.send FetchBrand request
