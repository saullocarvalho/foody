defmodule Foody.Product do
  use Foody.Web, :model

  @derive {Poison.Encoder, only: [:id, :type_id, :brand_id, :expires_at]}

  schema "products" do
    field :expires_at, Ecto.Date
    field :consumed, :boolean, default: false
    belongs_to :type, Foody.Type
    belongs_to :brand, Foody.Brand

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @fields [:expires_at, :type_id, :brand_id]
  @required [:expires_at, :type_id, :brand_id]
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required)
    |> assoc_constraint(:type)
    |> assoc_constraint(:brand)
  end
end
