defmodule Foody.Type do
  use Foody.Web, :model

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at]}

  schema "types" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
