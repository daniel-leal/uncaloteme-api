defmodule UncaloteMe.AppContext.Debtor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "debtors" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :phone, :string
    has_many :debts, UncaloteMe.AppContext.Debt

    timestamps()
  end

  @doc false
  def changeset(debtor, attrs) do
    debtor
    |> cast(attrs, [:name, :email, :phone, :avatar])
    |> validate_required([:name])
  end
end
