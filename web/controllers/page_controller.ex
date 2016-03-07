defmodule ElmColors.PageController do
  use ElmColors.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
