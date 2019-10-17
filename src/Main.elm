module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, div, input, text, button, ul, li)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import List exposing (..)
import Array exposing (Array)
main =
  Browser.sandbox { init = init, update = update, view = view }


type alias Model =
  { 
    content : String,
    empty : Array String 
  }


init : Model
init =
  {
    content = "",
    empty= Array.fromList []
  }


type Msg
  = SubmitText String
  | Change String
  | Remove String

update : Msg -> Model -> Model
update msg model =
  case msg of
      SubmitText bank ->
        { model | empty = Array.push bank model.empty }
      Change bank ->
        { model | content = bank }
      Remove bank ->
        { model | empty = Array.slice}


view : Model -> Html Msg
view model =
  div []
    [  input [ placeholder "input someting", value model.content, onInput Change ] [] 
    , button [ onClick (SubmitText model.content)]  [ text "กดดิวะ" ]
    , ul [] (Array.toList (Array.map (\t -> li [] [text t ,  button[ onClick (Remove()) ] [text "x"]] ) model.empty))
    , button [] [text "s"]
    ]

