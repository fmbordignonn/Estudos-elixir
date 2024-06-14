defmodule BankApp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :password_hash, :email, :cep]

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  # é uma função q diz pra base o que fazer
  # cria usuario, atualiza, busca..., no caso um changeset faz tudo

  # \\%__MODULE__{} diz que por default eu inicio com um user vazio
  #
  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r'/@/')
    |> validate_length(:cep, is: 8)
  end
end

#  changeset = BankApp.Users.User.changeset(%{name: "oie", password_hash: "aaa", email: "asd@gmail", cep: "12345678"})

# Repo.get(User, 1)
