defmodule UncaloteMe.AppContext.Debt do
  use Ecto.Schema
  import Ecto.Changeset


  schema "debts" do
    field :amount_paid, :decimal, default: 0.0
    field :date, :date
    field :description, :string
    field :is_active, :boolean, default: false
    field :value, :decimal
    belongs_to :debtor, UncaloteMe.AppContext.Debtor

    timestamps()
  end

  @doc false
  def changeset(debt, attrs) do
    debt
    |> cast(attrs, [:date, :is_active, :amount_paid, :value, :description, :debtor_id])
    |> validate_required([:date, :is_active, :value, :description, :debtor_id])
  end
end
