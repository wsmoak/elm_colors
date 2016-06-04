module MyColors where

import StartApp
import Html exposing (Html, Attribute, text, div)
import Html.Attributes exposing (style)
import Effects exposing (Effects, Never)
import String exposing (concat)

app =
    StartApp.start { init = init, view = view, update = update, inputs = inputs }

main : Signal Html
main =
    app.html

the_style : String -> Attribute
the_style colors =
  style
    [ ("backgroundColor", colors)
    , ("height", "150px")
    , ("width", "50%")
    ]

rgb : Model -> String
rgb (red,green,blue) =
  concat ["rgb(",red,",",green,",",blue,")"]

view : Signal.Address action -> Model -> Html
view address model =
  div [the_style (rgb model)]
   [text "Hello from Elm StartApp! This box will change color as the Phoenix app generates random numbers for red, green, and blue, and pushes a list such as [\"121\",\"239\",\"34\"] down the channel to be used as the background color in the stylesheet. Open the JavaScript console to see the messages arrive."
   ]

type alias Model = (String,String,String)

inputs : List (Signal Action)
inputs = [incomingActions]

type Action =  SetColors Model

update : Action -> model -> (Model, Effects action)
update action model =
  case action of
    SetColors colors -> (colors, Effects.none)

init : (Model, Effects Action)
init = ( initialModel , Effects.none)

initialModel : Model
initialModel =
  ("0","255","0")

incomingActions : Signal Action
incomingActions =
  Signal.map SetColors colors

port colors : Signal Model
