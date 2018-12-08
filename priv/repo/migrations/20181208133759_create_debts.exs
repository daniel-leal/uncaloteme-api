defmodule UncaloteMe.Repo.Migrations.CreateDebts do
  use Ecto.Migration

  def change do
    create table(:debts) do
      add :date, :date
      add :is_active, :boolean, default: true, null: true
      add :amount_paid, :decimal, precision: 10, scale: 2
      add :value, :decimal, precision: 10, scale: 2
      add :description, :string
      add :debtor_id, references(:debtors, on_delete: :nothing)

      timestamps()
    end

    create index(:debts, [:debtor_id])
  end
end
