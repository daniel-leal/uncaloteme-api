defmodule UncaloteMeWeb.DebtView do
  use UncaloteMeWeb, :view
  alias UncaloteMeWeb.DebtView

  def render("index.json", %{debts: debts}) do
    %{data: render_many(debts, DebtView, "debt.json")}
  end

  def render("show.json", %{debt: debt}) do
    %{data: render_one(debt, DebtView, "debt.json")}
  end

  def render("debtor.json", %{debtor: debtor}) do
    %{id: debtor.id,
      name: debtor.name,
      email: debtor.email,
      phone: debtor.phone,
      avatar: debtor.avatar}
  end

  def render("debt.json", %{debt: debt}) do
    %{id: debt.id,
      date: debt.date,
      is_active: debt.is_active,
      amount_paid: debt.amount_paid,
      value: debt.value,
      description: debt.description,
      }
  end
end
