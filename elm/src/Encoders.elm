module Encoders exposing (..)

import Json.Encode as JE exposing (..)
import Model exposing (..)


typeEncoder : Type -> JE.Value
typeEncoder t =
    object
        [ ( "name", string t.name ) ]
