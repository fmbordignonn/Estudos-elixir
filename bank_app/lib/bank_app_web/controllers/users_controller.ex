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
      |> put_status(:created)
      |> render(:create_ok_response, user: user)
    end
  end

  # pra receber parametros no controller precisa ser por string e não atom
  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  #   # error.json é o padrão
  #   # |> render("error.json", error: error)
  # end
end
