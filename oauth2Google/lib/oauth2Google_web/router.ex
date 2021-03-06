defmodule Oauth2GoogleWeb.Router do
  use Oauth2GoogleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Oauth2GoogleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index


  end


    scope "/auth", Oauth2GoogleWeb do
      pipe_through :browser # Use the default browser stack


      get "/:provider", AuthController, :index
      get "/:provider/callback", AuthController, :callback
      delete "/logout", AuthController, :delete

    end

    defp assign_current_user(conn, _) do
      assign(conn, :current_user, get_session(conn, :current_user))
    end
  # Other scopes may use custom stacks.
  # scope "/api", Oauth2GoogleWeb do
  #   pipe_through :api
  # end
end
