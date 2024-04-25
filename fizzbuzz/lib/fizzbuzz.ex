defmodule Fizzbuzz do


  def readFile(path) do
    data = File.read(path)
    #a ultima linha sempre é o retorno
    IO.inspect(data)
  end

  #-------------------------------------------------

  def readFileComCase(path) do
    case File.read(path) do
      {:ok, data} -> data
      {:error, message} -> "xii deu erro com case: #{message}"
    end
  end


  #-------------------------------------------------
  def readFileFinal(path) do
     path
     |> File.read()
     |> handleFileRead()
  end


  def handleFileRead({:ok, result}) do
    """
    Isso funciona:
    String.split(result, ",")
    |> Enum.map(fn value -> String.to_integer(value) end)

    Porém, quando a operação desejada é simplesmente pegar o parametro de uma fn anonima e passar pra outra fn definida,
    dá pra simplesmente repassar pra outra função botando & na frente e informando a aridade (numero de argumentos) da função
    """
    result
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)

  end



  def handleFileRead({:error, message}), do: "xii deu erro com function #{message}"



end
