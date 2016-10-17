defmodule BlogPress.Router do
  use BlogPress.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  
  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession, key: :admin
    plug Guardian.Plug.LoadResource, key: :admin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPress do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BlogPress do
    pipe_through :api
    
    resources "/articles", ArticlesController, only: [:show]
  end
  
  scope "/admin", BlogPress, as: :admin do
    pipe_through [:browser, :browser_auth]
    
    get "/", Admin.PageController, :index
    # login
    get "/login", Admin.SessionController, :login
    post "/login", Admin.SessionController, :create
    get "/logout", Admin.SessionController, :destroy
    
    get "/*any", Admin.PageController, :index
  end
  
  scope "/", BlogPress do
    pipe_through :browser # Use the default browser stack
    # for vue-router
    get "/*any", PageController, :index
  end
end
