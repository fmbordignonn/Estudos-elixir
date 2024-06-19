defmodule BankApp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :password, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
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
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    # ue n pegou
    # |> unique_constraint(:email)
    |> add_pwd_hash()
  end

  defp add_pwd_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password_hash: Pbkdf2.hash_pwd_salt(password)})
  end

  defp add_pwd_hash(changeset), do: changeset
end

#  changeset = BankApp.Users.User.changeset(%{name: "oie", password_hash: "aaa", email: "asd@gmail", cep: "12345678"})

# Repo.get(User, 1)
