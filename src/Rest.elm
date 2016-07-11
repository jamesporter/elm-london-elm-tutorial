module Rest exposing (..)

import Types exposing (..)
import Json.Decode exposing (..)
import Http exposing (get)
import Task

endpoint: String
endpoint = "http://hn.algolia.com/api/v1/search_by_date?tags=story&hitsPerPage=50"

getNews : Cmd Msg
getNews =
    get decodeNews endpoint
    |> Task.perform Result.Err Result.Ok
    |> Cmd.map GetNewsResponse

decodeNews : Decoder (List News)
decodeNews =
    "hits" := (list decodeNewsItem)

decodeNewsItem: Decoder News
decodeNewsItem =
    object1 News
        ("title" := string)