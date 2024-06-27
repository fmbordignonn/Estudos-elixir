defmodule BankAppWeb.FallbackController do
  use BankAppWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: BankAppWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(400)
    |> put_view(json: BankAppWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
