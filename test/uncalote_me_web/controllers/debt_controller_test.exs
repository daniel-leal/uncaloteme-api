defmodule UncaloteMeWeb.DebtControllerTest do
  use UncaloteMeWeb.ConnCase

  alias UncaloteMe.AppContext
  alias UncaloteMe.AppContext.Debt

  @create_attrs %{
    amount_paid: "120.5",
    date: ~D[2010-04-17],
    description: "some description",
    is_active: true,
    value: "120.5"
  }
  @update_attrs %{
    amount_paid: "456.7",
    date: ~D[2011-05-18],
    description: "some updated description",
    is_active: false,
    value: "456.7"
  }
  @invalid_attrs %{amount_paid: nil, date: nil, description: nil, is_active: nil, value: nil}

  def fixture(:debt) do
    {:ok, debt} = AppContext.create_debt(@create_attrs)
    debt
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all debts", %{conn: conn} do
      conn = get(conn, Routes.debt_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create debt" do
    test "renders debt when data is valid", %{conn: conn} do
      conn = post(conn, Routes.debt_path(conn, :create), debt: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.debt_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount_paid" => "120.5",
               "date" => "2010-04-17",
               "description" => "some description",
               "is_active" => true,
               "value" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.debt_path(conn, :create), debt: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update debt" do
    setup [:create_debt]

    test "renders debt when data is valid", %{conn: conn, debt: %Debt{id: id} = debt} do
      conn = put(conn, Routes.debt_path(conn, :update, debt), debt: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.debt_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount_paid" => "456.7",
               "date" => "2011-05-18",
               "description" => "some updated description",
               "is_active" => false,
               "value" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, debt: debt} do
      conn = put(conn, Routes.debt_path(conn, :update, debt), debt: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete debt" do
    setup [:create_debt]

    test "deletes chosen debt", %{conn: conn, debt: debt} do
      conn = delete(conn, Routes.debt_path(conn, :delete, debt))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.debt_path(conn, :show, debt))
      end
    end
  end

  defp create_debt(_) do
    debt = fixture(:debt)
    {:ok, debt: debt}
  end
end
