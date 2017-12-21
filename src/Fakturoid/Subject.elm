module Fakturoid.Subject exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Http exposing (Request)
import Fakturoid.Config exposing (Config, get)


type alias Subject =
    { id : Int
    , name : String
    , email : Maybe String
    , privateNote : Maybe String
    }


subjectDecoder : Decoder Subject
subjectDecoder =
    decode Subject
        |> required "id" int
        |> required "name" string
        |> optional "email" (nullable string) Nothing
        |> optional "privateNote" (nullable string) Nothing


getSubjectDetails : Config -> Int -> Request Subject
getSubjectDetails config num =
    let
        path =
            "/subjects/" ++ toString num ++ ".json"
    in
        get config path subjectDecoder
