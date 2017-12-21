module Fakturoid.Config exposing (..)

import Json.Decode exposing (Decoder)
import Http
import BasicAuth


type alias Config =
    { user : String
    , token : String
    , slug : String
    }


buildAuthHeader : Config -> Http.Header
buildAuthHeader config =
    BasicAuth.buildAuthorizationHeader config.user config.token


buildBaseURL : Config -> String
buildBaseURL config =
    "https://app.fakturoid.cz/api/v2/accounts/" ++ config.slug


get : Config -> String -> Decoder a -> Http.Request a
get config path decoder =
    let
        authHeader =
            buildAuthHeader config

        url =
            (buildBaseURL config) ++ path
    in
        Http.request
            { method = "GET"
            , headers = [ authHeader ]
            , url = url
            , body = Http.emptyBody
            , expect = Http.expectJson decoder
            , timeout = Nothing
            , withCredentials = False
            }
