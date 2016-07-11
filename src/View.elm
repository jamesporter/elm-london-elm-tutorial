module View exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

root : Model -> Html Msg
root model =
    div []
    [ h1 [ style [ ( "font-style", "italic")]] [ text "News!"]
    , ul []
        (List.map newsItem model.news)
    , text (toString model)
    ]

newsItem : News -> Html Msg
newsItem news =
    li []
        [ h3 [] [ text news.headline] ]