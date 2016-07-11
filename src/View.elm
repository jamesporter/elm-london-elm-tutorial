module View exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

root : Model -> Html Msg
root model =
    div [ style [("padding",  "20px"), ("font-size", "1.1em")]]
    [ h1 [ style [ ( "font-style", "italic")]] [ text "News!"]
    , case model.news of
        Loading ->
            text "Loading"
        Succeed news ->
            ul []
                (List.map newsItem news)
        Failed error ->
            text "Error"
    ]

newsItem : News -> Html Msg
newsItem news =
    li []
        [ h3 [] [ text news.headline] ]