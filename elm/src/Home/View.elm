module Home.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)


homeView : Html Msg
homeView =
    div [ class "jumbotron" ]
        [ h2 [] [ text "Hello, Foody!" ]
        , p [] [ text "Manage, control and consume your food safely!" ]
        ]
