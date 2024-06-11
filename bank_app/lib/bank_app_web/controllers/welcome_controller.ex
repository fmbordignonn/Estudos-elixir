defmodule BankAppWeb.WelcomeController do
  use BankAppWeb, :controller

  # no phoenix, sempre estamos manipulando uma conexão
  def index(connection, params) do
    IO.inspect(connection)
    IO.inspect(params)

    # sempre precisa devolver a conexão no final do endpoint
    connection
    |> put_status(:ok)
    |> json(%{message: "teste!"})
  end
end
