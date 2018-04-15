defmodule Oauth2GoogleWeb.PageController do
  use  Oauth2GoogleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
