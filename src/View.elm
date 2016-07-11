module View exposing (..)

import Types exposing (..)
import Html exposing (..)

root : Model -> Html Msg
root model =
    text (toString model)