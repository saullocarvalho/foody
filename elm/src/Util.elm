module Util exposing (..)

import Date.Extra as DE
import Date exposing (..)
import Model exposing (..)


toIsoString : Date -> String
toIsoString date =
    let
        monthString =
            date
                |> DE.monthNumber
                |> toString
                |> String.padLeft 2 '0'

        dayString =
            date
                |> DE.toUtcFormattedString "d"
                |> String.padLeft 2 '0'

        yearString =
            date
                |> year
                |> toString
                |> String.padLeft 2 '0'
    in
        yearString ++ "-" ++ monthString ++ "-" ++ dayString


compareProduct : Product -> String
compareProduct p =
    toIsoString (p.expiresAt)
