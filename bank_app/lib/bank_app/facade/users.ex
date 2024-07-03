defmodule BankApp.Users do
  defdelegate create(params), to: BankApp.Users.Create, as: :call

  defdelegate get(id), to: BankApp.Users.Get, as: :call

  defdelegate update(params), to: BankApp.Users.Update, as: :call
end
