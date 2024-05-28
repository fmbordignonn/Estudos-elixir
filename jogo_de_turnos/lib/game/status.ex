defmodule JogoDeTurnos.Game.Status do
  alias JogoDeTurnos.GameAgent

  def print_start_message do
    IO.puts("\n ===== The game has started! =====\n")
    IO.inspect(GameAgent.info())
    IO.puts("------------------------------")
  end

  def print_wrong_move(move), do: IO.puts("Invalid movement: #{move}.")

  def print_move_executed_message(:computer, :attack, damage),
    do: IO.puts("\n ===== Player attacked computer for #{damage} damage! =====\n")

  def print_move_executed_message(:player, :attack, damage),
    do: IO.puts("\n ===== Computer attacked player for #{damage} damage! =====\n")
end
