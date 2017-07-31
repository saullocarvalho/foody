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


idEncoder : Id -> JE.Value
idEncoder id =
    object
        [ ( "id", int id.id ) ]
