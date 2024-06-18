defmodule BankApp.Users.Create do
  alias BankApp.Users.User
  alias BankApp.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
