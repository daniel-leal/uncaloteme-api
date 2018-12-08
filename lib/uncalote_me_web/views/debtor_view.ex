defmodule UncaloteMeWeb.DebtorView do
  use UncaloteMeWeb, :view
  alias UncaloteMeWeb.DebtorView

  def render("index.json", %{debtors: debtors}) do
    %{data: render_many(debtors, DebtorView, "debtor.json")}
  end

  def render("show.json", %{debtor: debtor}) do
    %{data: render_one(debtor, DebtorView, "debtor.json")}
  end

  def render("debtor.json", %{debtor: debtor}) do
    %{id: debtor.id,
      name: debtor.name,
      email: debtor.email,
      phone: debtor.phone,
      avatar: debtor.avatar}
  end
end
