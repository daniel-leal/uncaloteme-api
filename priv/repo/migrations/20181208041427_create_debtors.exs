defmodule UncaloteMe.Repo.Migrations.CreateDebtors do
  use Ecto.Migration

  def change do
    create table(:debtors) do
      add :name, :string, null: false
      add :email, :string
      add :phone, :string
      add :avatar, :string

      timestamps()
    end

  end
end
