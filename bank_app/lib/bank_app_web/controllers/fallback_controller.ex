defmodule BankAppWeb.FallbackController do
  use BankAppWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(400)
    |> put_view(json: BankAppWeb.ErrorJSON)
    |> render(:error, changeset: changeset)

    # error.json é o padrão
    # |> render("error.json", error: error)
  end
end
