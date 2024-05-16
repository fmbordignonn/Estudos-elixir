defmodule JogoDeTurnos.Game.Status do
  alias JogoDeTurnos.GameAgent

  def print_start_message do
    IO.puts("\n ===== The game has started! =====\n")
    IO.inspect(GameAgent.info())
    IO.puts("------------------------------")
  end
end
