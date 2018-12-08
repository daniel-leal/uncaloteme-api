defmodule UncaloteMeWeb.DebtorController do
  use UncaloteMeWeb, :controller

  alias UncaloteMe.AppContext
  alias UncaloteMe.AppContext.Debtor

  action_fallback UncaloteMeWeb.FallbackController

  def index(conn, _params) do
    debtors = AppContext.list_debtors()
    render(conn, "index.json", debtors: debtors)
  end

  def create(conn, %{"debtor" => debtor_params}) do
    with {:ok, %Debtor{} = debtor} <- AppContext.create_debtor(debtor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.debtor_path(conn, :show, debtor))
      |> render("show.json", debtor: debtor)
    end
  end

  def show(conn, %{"id" => id}) do
    debtor = AppContext.get_debtor!(id)
    render(conn, "show.json", debtor: debtor)
  end

  def update(conn, %{"id" => id, "debtor" => debtor_params}) do
    debtor = AppContext.get_debtor!(id)

    with {:ok, %Debtor{} = debtor} <- AppContext.update_debtor(debtor, debtor_params) do
      render(conn, "show.json", debtor: debtor)
    end
  end

  def delete(conn, %{"id" => id}) do
    debtor = AppContext.get_debtor!(id)

    with {:ok, %Debtor{}} <- AppContext.delete_debtor(debtor) do
      send_resp(conn, :no_content, "")
    end
  end
end
