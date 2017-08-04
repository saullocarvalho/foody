defmodule Foody.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :expires_at, :date
      add :consumed, :boolean, default: false, null: false
      add :type_id, references(:types, on_delete: :nothing)
      add :brand_id, references(:brands, on_delete: :nothing)

      timestamps()
    end
    create index(:products, [:type_id])
    create index(:products, [:brand_id])

  end
end
