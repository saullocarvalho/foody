module Storage.Item exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Product)
import Messages exposing (Msg(..))
import Date exposing (Date)
import Date.Extra as DE exposing (..)


storageItem : Date -> Product -> Html Msg
storageItem today p =
    let
        timeToExpire =
            p.expiresAt
                |> DE.diff Day today

        itemClass =
            if timeToExpire <= 5 then
                "danger"
            else if timeToExpire <= 10 then
                "warning"
            else
                ""
    in
        tr [ class itemClass ]
            [ td [] [ text p.productBrand.name ]
            , td [] [ text p.productType.name ]
            , td [] [ p.expiresAt |> DE.toUtcFormattedString "MMMM d, y" |> text ]
            , td [] [ p.count |> toString |> text ]
            ]
