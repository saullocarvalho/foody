# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Foody.Repo.insert!(%Foody.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Foody.Repo
alias Foody.Type

IO.puts "---- Deleting existing food types"

Repo.delete_all Type

IO.puts "---- Creating food types"

for name <- ["Milk", "Eggs", "Meat", "Bread"] do
  params = %{name: name}

  {:ok, type} = %Type{}
    |> Type.changeset(params)
    |> Repo.insert

  IO.puts "---- Inserted food type #{type.id}"
end
