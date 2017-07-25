module View exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ text "Hello World!" ]
