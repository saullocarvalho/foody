module Encoders exposing (..)

import Json.Encode as JE exposing (..)
import Model exposing (..)


typeEncoder : Type -> JE.Value
typeEncoder t =
    object
        [ ( "name", string t.name ) ]


brandEncoder : Brand -> JE.Value
brandEncoder b =
    object
        [ ( "name", string b.name ) ]


productEncoder : SendProduct -> JE.Value
productEncoder p =
    object
        [ ( "type_id", int p.typeId )
        , ( "brand_id", int p.brandId )
        , ( "expires_at", string p.expiresAt )
        ]


idEncoder : Id -> JE.Value
idEncoder id =
    object
        [ ( "id", int id.id ) ]
