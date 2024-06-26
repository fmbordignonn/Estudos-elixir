defmodule JogoDeTurnos.Game.Status do
  def print_round_message(%{status: :game_start} = info) do
    IO.puts("\n ===== The game has started! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n ===== It's #{player} turn. =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n ===== The game is over! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_wrong_move(move), do: IO.puts("Invalid movement: #{move}.")

  def print_move_executed_message(:computer, :attack, damage),
    do: IO.puts("\n ===== Player attacked computer for #{damage} damage! =====\n")

  def print_move_executed_message(:player, :attack, damage),
    do: IO.puts("\n ===== Computer attacked player for #{damage} damage! =====\n")

  def print_move_executed_message(player, :heal, life),
    do: IO.puts("\n ===== #{player} healed to #{life}! =====\n")
end
