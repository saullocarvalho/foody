defmodule Foody.TestHelpers do
  alias Foody.Repo

# TODO: Use Type.changeset(%Type{}, attrs)
  def insert_type(attrs \\ %{}) do
    %Foody.Type{}
    |> Foody.Type.changeset(attrs)
    |> Repo.insert!()
  end

  def insert_brand(attrs \\ %{}) do
    %Foody.Brand{}
    |> Foody.Brand.changeset(attrs)
    |> Repo.insert!()
  end
end
