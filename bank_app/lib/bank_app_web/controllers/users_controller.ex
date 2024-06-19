defmodule BankAppWeb.UsersController do
  use BankAppWeb, :controller

  alias BankApp.Users
  alias Users.User
  alias BankAppWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    # pattern-matching de função, ou seja, se Create.call na direita
    # retornar a tupla da esquerda, executa o codigo abaixo
    # pode se ter varios withs dentro de uma mesma funçao
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(201)
      |> render(:create_ok_response, user: user)
    end
  end

  # pode ser usado dessa forma.... mas acaba se tornando insustentável a longo prazo
  # o ideal mesmo é um fallback controller

  # defp handle_response({:ok, user}, conn) do
  #   conn
  #   |> put_status(201)
  #   |> render(:create_ok_response, user: user)
  # end

  # defp handle_response({:error, changeset}, conn) do
  #   conn
  #   |> put_status(400)
  #   |> put_view(json: BankAppWeb.ErrorJSON)
  #   |> render(:error, changeset: changeset)

  #   # error.json é o padrão
  #   # |> render("error.json", error: error)
  # end
end
