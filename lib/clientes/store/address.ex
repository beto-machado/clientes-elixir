defmodule Clientes.Store.Address do
  @moduledoc """
  Address schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @type t() :: %Address{}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_otps [type: :utc_datetime_usec]

  schema "addresses" do
    field :zipcode, :string
    field :street, :string
    field :number, :string
    field :district, :string
    field :city, :string
    field :state, :string
    field :complement, :string
  end

  @required_fields ~w(zipcode street number district city state)a
  @optional_fields ~w(complement)a
  @castable_fields @required_fields ++ @optional_fields

  def changeset(address \\ %Address{}, attrs) do
    address
    |> cast(attrs, @castable_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(~w(zipcode street number)a)
  end
end
