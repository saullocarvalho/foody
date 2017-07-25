module Type.View exposing (..)

import Html exposing (..)
import Model exposing (Type)
import Messages exposing (Msg)


typeView : Type -> Html Msg
typeView t =
    li []
        [ div [] [ t.id |> toString |> text ]
        , div [] [ text t.name ]
        ]
