module Commands exposing (..)

import Decoders exposing (..)
import Encoders exposing (..)
import Http exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)
import Json.Decode exposing (..)


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


createType : Type -> Cmd Msg
createType newType =
    let
        apiUrl =
            "/api/types"

        body =
            newType
                |> typeEncoder
                |> Http.jsonBody

        request =
            Http.post apiUrl body typeDecoder
    in
        Http.send CreateType request


deleteType : Int -> Cmd Msg
deleteType typeId =
    let
        apiUrl =
            "/api/types/" ++ toString typeId

        body =
            Http.emptyBody

        request =
            httpDelete apiUrl body typeDecoder
    in
        Http.send DeleteType request


httpPut : String -> Body -> Decoder a -> Request a
httpPut url body decoder =
    request
        { method = "PUT"
        , headers = []
        , url = url
        , body = body
        , expect = expectJson decoder
        , timeout = Nothing
        , withCredentials = False
        }


httpDelete : String -> Body -> Decoder a -> Request a
httpDelete url body decoder =
    request
        { method = "DELETE"
        , headers = []
        , url = url
        , body = body
        , expect = expectJson decoder
        , timeout = Nothing
        , withCredentials = False
        }
