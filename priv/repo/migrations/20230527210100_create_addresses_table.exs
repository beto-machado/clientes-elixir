defmodule Clientes.Repo.Migrations.CreateAddressesTable do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :zipcode, :string, null: false
      add :street, :string, null: false
      add :number, :string, null: false
      add :district, :string, null: false
      add :city, :string, null: false
      add :state, :string, null: false
      add :complement, :string, null: true
    end

    create unique_index(:addresses, ~w(zipcode street number)a)
  end
end
