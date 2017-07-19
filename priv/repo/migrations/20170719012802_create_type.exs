defmodule Foody.Repo.Migrations.CreateType do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string

      timestamps()
    end

  end
end
