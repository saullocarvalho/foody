module Product.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Product)
import Messages exposing (Msg(..))
import Date.Extra as Date


productView : Product -> Html Msg
productView p =
    tr []
        [ td [] [ text p.productBrand.name ]
        , td [] [ text p.productType.name ]
        , td [] [ p.expiresAt |> Date.toUtcFormattedString "MMMM d, y" |> text ]
        , td [] [ p.count |> toString |> text ]
        , td []
            [ div
                [ class "btn-toolbar pull-right"
                , attribute "role" "toolbar"
                ]
                [ button
                    [ type_ "button"
                    , class "btn btn-default btn-sm"
                    , attribute "arial-label" "Consume"

                    -- , onClick (ClickEditType t)
                    ]
                    [ span
                        [ class "glyphicon glyphicon-cutlery"
                        , attribute "aria-hidden" "true"
                        ]
                        []
                    ]
                ]
            ]
        ]
