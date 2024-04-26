defmodule FizzBuzz do
  # def printFileRead(path) do
  # data = File.read(path)
  # a ultima linha sempre é o retorno
  # IO.inspect(data)
  # end

  # def readFileComCase(path) do
  # case File.read(path) do
  # {:ok, data} -> data
  # {:error, message} -> "xii deu erro com case: #{message}"
  # end
  # end

  # -------------------------------------------------
  def readFile(path) do
    path
    |> File.read()
    |> handleFileRead()
  end

  defp handleFileRead({:error, message}), do: {:error, "xii deu erro #{message}"}

  defp handleFileRead({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&doFizzBuzz/1)

    {:ok, result}
  end

  defp doFizzBuzz(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp doFizzBuzz(number) when rem(number, 3) == 0, do: :fizz
  defp doFizzBuzz(number) when rem(number, 5), do: :buzz
  defp doFizzBuzz(number), do: number

  # Quando a operação desejada é simplesmente pegar o parametro de uma fn anonima e passar pra outra fn definida,
  # dá pra simplesmente repassar pra outra função botando & na frente e informando a aridade (numero de argumentos) da função

  # É boa prática em Elixir retornar sempre uma tupla com os dois casos, :ok e :error, assim, pessoas que eventualmente
  # vão usar módulos criados por nós sempre vão conseguir seguir essa boa prática para fazer os pattern matching que precisar

  # Caso precise renomear um módulo, só rodar "mix do clean, phx.server" no diretório do projeto
end
