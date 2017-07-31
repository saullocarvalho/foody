module Messages exposing (..)

import Http
import Navigation
import Model exposing (..)
import Routing exposing (Route)


type Msg
    = FetchType (Result Http.Error TypeList)
    | CreateType (Result Http.Error Type)
    | UpdateType (Result Http.Error Type)
    | DeleteType (Result Http.Error Type)
    | SetTypeName String
    | ClickSaveType
    | ClickDeleteType Int
    | ClickEditType Type
    | FetchBrand (Result Http.Error BrandList)
    | CreateBrand (Result Http.Error Brand)
    | UpdateBrand (Result Http.Error Brand)
    | DeleteBrand (Result Http.Error Brand)
    | SetBrandName String
    | ClickSaveBrand
    | ClickDeleteBrand Int
    | ClickEditBrand Brand
    | UrlChange Navigation.Location
    | NavigateTo Route
