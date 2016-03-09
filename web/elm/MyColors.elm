module MyColors where

import StartApp
import Html exposing (Html, Attribute, text, div)
import Html.Attributes exposing (style)
import Effects exposing (Effects, Never)
import Task exposing ( Task )

app =
    StartApp.start { init = init, view = view, update = update, inputs = [] }

main : Signal Html
main =
    app.html

the_style : Attribute
the_style =
  style
    [ ("backgroundColor", "rgb(200,255,175)")
    , ("height", "90px")
    , ("width", "50%")
    ]

view : Signal.Address action -> model -> Html
view address model =
  div [the_style] [text "Hello from Elm StartApp!"]

type alias Model = String

inputs : List (Signal action)
inputs = []

type Action = NoOp

update : action -> model -> (model, Effects action)
update action model =
  ( model, Effects.none )

init : (Model, Effects Action)
init = ("", Effects.none)

port tasks : Signal (Task Never ())
port tasks =
    app.tasks
