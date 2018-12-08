defmodule UncaloteMeWeb.DebtorControllerTest do
  use UncaloteMeWeb.ConnCase

  alias UncaloteMe.AppContext
  alias UncaloteMe.AppContext.Debtor

  @create_attrs %{
    avatar: "some avatar",
    email: "some email",
    name: "some name",
    phone: "some phone"
  }
  @update_attrs %{
    avatar: "some updated avatar",
    email: "some updated email",
    name: "some updated name",
    phone: "some updated phone"
  }
  @invalid_attrs %{avatar: nil, email: nil, name: nil, phone: nil}

  def fixture(:debtor) do
    {:ok, debtor} = AppContext.create_debtor(@create_attrs)
    debtor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all debtors", %{conn: conn} do
      conn = get(conn, Routes.debtor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create debtor" do
    test "renders debtor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.debtor_path(conn, :create), debtor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.debtor_path(conn, :show, id))

      assert %{
               "id" => id,
               "avatar" => "some avatar",
               "email" => "some email",
               "name" => "some name",
               "phone" => "some phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.debtor_path(conn, :create), debtor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update debtor" do
    setup [:create_debtor]

    test "renders debtor when data is valid", %{conn: conn, debtor: %Debtor{id: id} = debtor} do
      conn = put(conn, Routes.debtor_path(conn, :update, debtor), debtor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.debtor_path(conn, :show, id))

      assert %{
               "id" => id,
               "avatar" => "some updated avatar",
               "email" => "some updated email",
               "name" => "some updated name",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, debtor: debtor} do
      conn = put(conn, Routes.debtor_path(conn, :update, debtor), debtor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete debtor" do
    setup [:create_debtor]

    test "deletes chosen debtor", %{conn: conn, debtor: debtor} do
      conn = delete(conn, Routes.debtor_path(conn, :delete, debtor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.debtor_path(conn, :show, debtor))
      end
    end
  end

  defp create_debtor(_) do
    debtor = fixture(:debtor)
    {:ok, debtor: debtor}
  end
end
