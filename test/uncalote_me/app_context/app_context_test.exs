defmodule UncaloteMe.AppContextTest do
  use UncaloteMe.DataCase

  alias UncaloteMe.AppContext

  describe "debtors" do
    alias UncaloteMe.AppContext.Debtor

    @valid_attrs %{avatar: "some avatar", email: "some email", name: "some name", phone: "some phone"}
    @update_attrs %{avatar: "some updated avatar", email: "some updated email", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{avatar: nil, email: nil, name: nil, phone: nil}

    def debtor_fixture(attrs \\ %{}) do
      {:ok, debtor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AppContext.create_debtor()

      debtor
    end

    test "list_debtors/0 returns all debtors" do
      debtor = debtor_fixture()
      assert AppContext.list_debtors() == [debtor]
    end

    test "get_debtor!/1 returns the debtor with given id" do
      debtor = debtor_fixture()
      assert AppContext.get_debtor!(debtor.id) == debtor
    end

    test "create_debtor/1 with valid data creates a debtor" do
      assert {:ok, %Debtor{} = debtor} = AppContext.create_debtor(@valid_attrs)
      assert debtor.avatar == "some avatar"
      assert debtor.email == "some email"
      assert debtor.name == "some name"
      assert debtor.phone == "some phone"
    end

    test "create_debtor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AppContext.create_debtor(@invalid_attrs)
    end

    test "update_debtor/2 with valid data updates the debtor" do
      debtor = debtor_fixture()
      assert {:ok, %Debtor{} = debtor} = AppContext.update_debtor(debtor, @update_attrs)
      assert debtor.avatar == "some updated avatar"
      assert debtor.email == "some updated email"
      assert debtor.name == "some updated name"
      assert debtor.phone == "some updated phone"
    end

    test "update_debtor/2 with invalid data returns error changeset" do
      debtor = debtor_fixture()
      assert {:error, %Ecto.Changeset{}} = AppContext.update_debtor(debtor, @invalid_attrs)
      assert debtor == AppContext.get_debtor!(debtor.id)
    end

    test "delete_debtor/1 deletes the debtor" do
      debtor = debtor_fixture()
      assert {:ok, %Debtor{}} = AppContext.delete_debtor(debtor)
      assert_raise Ecto.NoResultsError, fn -> AppContext.get_debtor!(debtor.id) end
    end

    test "change_debtor/1 returns a debtor changeset" do
      debtor = debtor_fixture()
      assert %Ecto.Changeset{} = AppContext.change_debtor(debtor)
    end
  end

  describe "debts" do
    alias UncaloteMe.AppContext.Debt

    @valid_attrs %{amount_paid: "120.5", date: ~D[2010-04-17], description: "some description", is_active: true, value: "120.5"}
    @update_attrs %{amount_paid: "456.7", date: ~D[2011-05-18], description: "some updated description", is_active: false, value: "456.7"}
    @invalid_attrs %{amount_paid: nil, date: nil, description: nil, is_active: nil, value: nil}

    def debt_fixture(attrs \\ %{}) do
      {:ok, debt} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AppContext.create_debt()

      debt
    end

    test "list_debts/0 returns all debts" do
      debt = debt_fixture()
      assert AppContext.list_debts() == [debt]
    end

    test "get_debt!/1 returns the debt with given id" do
      debt = debt_fixture()
      assert AppContext.get_debt!(debt.id) == debt
    end

    test "create_debt/1 with valid data creates a debt" do
      assert {:ok, %Debt{} = debt} = AppContext.create_debt(@valid_attrs)
      assert debt.amount_paid == Decimal.new("120.5")
      assert debt.date == ~D[2010-04-17]
      assert debt.description == "some description"
      assert debt.is_active == true
      assert debt.value == Decimal.new("120.5")
    end

    test "create_debt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AppContext.create_debt(@invalid_attrs)
    end

    test "update_debt/2 with valid data updates the debt" do
      debt = debt_fixture()
      assert {:ok, %Debt{} = debt} = AppContext.update_debt(debt, @update_attrs)
      assert debt.amount_paid == Decimal.new("456.7")
      assert debt.date == ~D[2011-05-18]
      assert debt.description == "some updated description"
      assert debt.is_active == false
      assert debt.value == Decimal.new("456.7")
    end

    test "update_debt/2 with invalid data returns error changeset" do
      debt = debt_fixture()
      assert {:error, %Ecto.Changeset{}} = AppContext.update_debt(debt, @invalid_attrs)
      assert debt == AppContext.get_debt!(debt.id)
    end

    test "delete_debt/1 deletes the debt" do
      debt = debt_fixture()
      assert {:ok, %Debt{}} = AppContext.delete_debt(debt)
      assert_raise Ecto.NoResultsError, fn -> AppContext.get_debt!(debt.id) end
    end

    test "change_debt/1 returns a debt changeset" do
      debt = debt_fixture()
      assert %Ecto.Changeset{} = AppContext.change_debt(debt)
    end
  end
end
