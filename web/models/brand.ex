defmodule Foody.Brand do
  use Foody.Web, :model

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at]}

  schema "brands" do
    field :name, :string
    has_many :products, Foody.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @fields [:name]
  @required [:name]
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required)
    |> unique_constraint(:name)
  end
end
