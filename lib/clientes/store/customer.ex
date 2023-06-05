defmodule Clientes.Store.Customer do
  @moduledoc """
  Customer schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Clientes.Store.Address

  @type t() :: %Customer{}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_otps [type: :utc_datetime_usec]

  schema "customers" do
    belongs_to :address, Address

    field :name, :string
    field :email, :string
    field :cpf, :string
    field :phone, :string
    field :birthdate, :date
  end

  @required_fields ~w(name email cpf phone birthdate)a
  @castable_fields @required_fields

  def changeset(customer \\ %Customer{}, attrs) do
    customer
    |> cast(attrs, @castable_fields)
    |> cast_assoc(:address, with: &Address.changeset/2)
    |> validate_required(@required_fields)
    |> unique_constraint(~w(email)a)
    |> unique_constraint(~w(cpf)a)
    |> unique_constraint(~w(phone)a)
  end
end
