module MyColors where

import StartApp
import Html exposing (Html, Attribute, text, div)
import Html.Attributes exposing (style)
import Effects exposing (Effects, Never)

app =
    StartApp.start { init = init, view = view, update = update, inputs = inputs }

main : Signal Html
main =
    app.html

the_style : String -> Attribute
the_style colors =
  style
    [ ("backgroundColor", colors)
    , ("height", "90px")
    , ("width", "50%")
    ]

view : Signal.Address action -> String -> Html
view address model =
  div [the_style model] [text "Hello from Elm StartApp!"]

type alias Model = String

inputs : List (Signal Action)
inputs = [incomingActions]

type Action =  SetColors Model

update : Action -> model -> (String, Effects action)
update action model =
  case action of
    SetColors colors -> (colors, Effects.none)

init : (Model, Effects Action)
init = ("green", Effects.none)

incomingActions : Signal Action
incomingActions =
  Signal.map SetColors colors

port colors : Signal Model
