defmodule Clientes.Repo do
  use Ecto.Repo,
    otp_app: :clientes,
    adapter: Ecto.Adapters.Postgres
end
