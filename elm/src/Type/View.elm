module Type.View exposing (..)

import Html exposing (..)
import Model exposing (Type)
import Messages exposing (Msg)


typeView : Type -> Html Msg
typeView t =
    tr []
        [ td [] [ t.id |> toString |> text ]
        , td [] [ text t.name ]
        ]
