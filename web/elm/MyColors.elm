module MyColors where

import StartApp
import Html
import Effects exposing (Effects, Never)
import Task exposing ( Task )

app =
    StartApp.start { init = init, view = view, update = update, inputs = [] }

main : Signal Html.Html
main =
    app.html

view : Signal.Address action -> model -> Html.Html
view address model =
  Html.text "Hello from Elm StartApp!"

type alias Model = String

inputs : List (Signal action)
inputs = []

type Action = NoOp

update : action -> model -> (model, Effects action)
update action model =
  ( model, Effects.none )

init : (Model, Effects Action)
init = ("", Effects.none)

port tasks : Signal (Task.Task Never ())
port tasks =
    app.tasks
