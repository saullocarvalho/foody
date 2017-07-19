defmodule Foody.TestHelpers do
  alias Foody.Repo

  def insert_type(attrs \\ %{}) do
    %Foody.Type{}
    |> Foody.Type.changeset(attrs)
    |> Repo.insert!()
  end
end
