module View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Messages exposing (Msg(..))
import Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
