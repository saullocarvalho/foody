module Decoders exposing (..)

import Json.Decode as JD exposing (..)
import Json.Decode.Extra exposing ((|:))
import Model exposing (..)


typeListDecoder : JD.Decoder TypeList
typeListDecoder =
    succeed
        TypeList
        |: (field "types" (list typeDecoder))


typeDecoder : JD.Decoder Type
typeDecoder =
    succeed
        Type
        |: (field "id" int)
        |: (field "name" string)


brandListDecoder : JD.Decoder BrandList
brandListDecoder =
    succeed
        BrandList
        |: (field "brands" (list brandDecoder))


brandDecoder : JD.Decoder Brand
brandDecoder =
    succeed
        Brand
        |: (field "id" int)
        |: (field "name" string)
