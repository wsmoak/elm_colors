# ElmColors

Example of using Elm with Phoenix Channels

See http://www.cultivatehq.com/posts/phoenix-elm-11/ (and previous articles)

Further inspiration from @jfcloutier in http://files.meetup.com/17314552/february_23_2016.pdf

To start the Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Open the JavaScript console and you will see

* it join the channel
* the Phoenix app push a list of random color numbers at random 1-10 second intervals
* the background of the div change color when a message is received

The interesting bits of code are

* https://github.com/wsmoak/elm_colors/blob/master/web/elm/MyColors.elm
* https://github.com/wsmoak/elm_colors/blob/master/web/channels/color_channel.ex
* https://github.com/wsmoak/elm_colors/blob/master/web/static/js/app.js

![Elm Colors Example](http://wsmoak.net/images/2016/03/elm_colors_example.png)
