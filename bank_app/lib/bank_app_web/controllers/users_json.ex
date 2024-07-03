defmodule BankAppWeb.UsersJSON do
  alias BankApp.Users.User

  def create_ok_response(%{user: user}) do
    %{
      message: "Usuario criado",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}

  def update(%{user: user}), do: %{message: "Atualizado com sucesso", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      cep: user.cep,
      email: user.email
    }
  end
end
