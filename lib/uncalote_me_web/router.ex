defmodule UncaloteMeWeb.Router do
  use UncaloteMeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UncaloteMeWeb do
    pipe_through :api
  end
end
