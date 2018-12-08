defmodule UncaloteMeWeb.Router do
  use UncaloteMeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UncaloteMeWeb do
    pipe_through :api

    resources "/debtors", DebtorController, except: [:new, :edit] do
      resources "/debts", DebtController, except: [:new, :edit]
    end
  end
end
