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


fetchProducts : Cmd Msg
fetchProducts =
    let
        apiUrl =
            "/api/products"

        request =
            Http.get apiUrl productListDecoder
    in
        Http.send FetchProduct request


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


createBrand : Brand -> Cmd Msg
createBrand newBrand =
    let
        apiUrl =
            "/api/brands"

        body =
            newBrand
                |> brandEncoder
                |> Http.jsonBody

        request =
            Http.post apiUrl body brandDecoder
    in
        Http.send CreateBrand request


createProduct : SendProduct -> Cmd Msg
createProduct newProduct =
    let
        apiUrl =
            "/api/products"

        body =
            newProduct
                |> productEncoder
                |> Http.jsonBody

        request =
            Http.post apiUrl body productDecoder
    in
        Http.send CreateProduct request


updateType : Type -> Cmd Msg
updateType editedType =
    let
        apiUrl =
            "/api/types/" ++ toString editedType.id

        body =
            editedType
                |> typeEncoder
                |> Http.jsonBody

        request =
            httpPut apiUrl body typeDecoder
    in
        Http.send UpdateType request


updateBrand : Brand -> Cmd Msg
updateBrand editedBrand =
    let
        apiUrl =
            "/api/brands/" ++ toString editedBrand.id

        body =
            editedBrand
                |> brandEncoder
                |> Http.jsonBody

        request =
            httpPut apiUrl body brandDecoder
    in
        Http.send UpdateBrand request


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


deleteBrand : Int -> Cmd Msg
deleteBrand brandId =
    let
        apiUrl =
            "/api/brands/" ++ toString brandId

        body =
            Http.emptyBody

        request =
            httpDelete apiUrl body brandDecoder
    in
        Http.send DeleteBrand request


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
