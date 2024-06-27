defmodule BankApp.Users.Get do
  alias BankApp.Users.User
  alias BankApp.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
