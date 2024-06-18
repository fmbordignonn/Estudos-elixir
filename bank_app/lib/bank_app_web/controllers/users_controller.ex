defmodule BankAppWeb.UsersController do
  use BankAppWeb, :controller

  alias BankApp.Users.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(201)
    |> render(:create_ok_response, user: user)
  end

  # defp handle_response({:error, _changeset} = error, conn) do
  #   conn
  #   |> put_status(400)
  #   |> render("error.json", error: error)
  # end
end
