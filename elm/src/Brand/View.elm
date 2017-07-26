module Brand.View exposing (..)

import Html exposing (..)
import Model exposing (Brand)
import Messages exposing (Msg)


brandView : Brand -> Html Msg
brandView b =
    tr []
        [ td [] [ b.id |> toString |> text ]
        , td [] [ text b.name ]
        ]
