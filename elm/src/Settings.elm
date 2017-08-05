module Settings exposing (..)

import DatePicker exposing (defaultSettings)


settings : DatePicker.Settings
settings =
    { defaultSettings
        | inputClassList = [ ( "form-control", True ) ]
        , inputName = Just "productExpiresAt"
        , inputId = Just "productExpiresAt"
        , placeholder = "Pick Expiration Date"
    }
