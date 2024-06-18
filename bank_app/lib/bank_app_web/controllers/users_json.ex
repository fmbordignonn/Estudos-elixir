defmodule BankAppWeb.UsersJSON do
  alias BankApp.Users.User

  def create_ok_response(%{user: user}) do
    %{
      message: "Usuario criado",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      cep: user.cep,
      email: user.email
    }
  end
end
