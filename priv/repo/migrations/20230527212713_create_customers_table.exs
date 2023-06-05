defmodule Clientes.Repo.Migrations.CreateCustomersTable do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;"

    create table(:customers) do
      add :name, :string, null: false
      add :email, :citext, null: false
      add :cpf, :citext, null: false
      add :phone, :citext, null: false
      add :birthdate, :date, null: false
      add :address_id, references(:addresses), null: false
    end

    create unique_index(:customers, :email)
    create unique_index(:customers, :cpf)
    create unique_index(:customers, :phone)
  end
end
