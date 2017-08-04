module Decoders exposing (..)

import Json.Decode as JD exposing (..)
import Json.Decode.Extra exposing ((|:), date)
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


productListDecoder : JD.Decoder ProductList
productListDecoder =
    succeed
        ProductList
        |: (field "products" (list productDecoder))


productDecoder : JD.Decoder Product
productDecoder =
    succeed
        Product
        |: (field "productType" typeDecoder)
        |: (field "productBrand" brandDecoder)
        |: (field "count" int)
        |: (field "expiresAt" date)


idDecoder : JD.Decoder Id
idDecoder =
    succeed
        Id
        |: (field "id" int)
