defmodule BankApp.Users do
  defdelegate create(params), to: BankApp.Users.Create, as: :call
end
