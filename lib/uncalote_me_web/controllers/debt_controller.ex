defmodule UncaloteMeWeb.DebtController do
  use UncaloteMeWeb, :controller

  alias UncaloteMe.AppContext
  alias UncaloteMe.AppContext.Debt

  action_fallback UncaloteMeWeb.FallbackController

  def index(conn, params) do
    debts = AppContext.list_debts()
    render(conn, "index.json", debts: debts)
  end

  def create(conn, %{"debt" => debt_params, "debtor_id" => debtor_id}) do
    debt_params = debt_params |> Map.put("debtor_id", debtor_id)

    with {:ok, %Debt{} = debt} <- AppContext.create_debt(debt_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.debtor_debt_path(conn, :show, debtor_id, debt))
      |> render("show.json", debt: debt)
    end
  end

  def show(conn, %{"id" => id}) do
    debt = AppContext.get_debt!(id)
    render(conn, "show.json", debt: debt)
  end

  def update(conn, %{"id" => id, "debt" => debt_params}) do
    debt = AppContext.get_debt!(id)

    with {:ok, %Debt{} = debt} <- AppContext.update_debt(debt, debt_params) do
      render(conn, "show.json", debt: debt)
    end
  end

  def delete(conn, %{"id" => id}) do
    debt = AppContext.get_debt!(id)

    with {:ok, %Debt{}} <- AppContext.delete_debt(debt) do
      send_resp(conn, :no_content, "")
    end
  end
end
