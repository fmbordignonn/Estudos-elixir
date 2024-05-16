defmodule JogoDeTurnos.Game.Actions do
  alias JogoDeTurnos.GameAgent

  def get_move(move) do
    GameAgent.get_player()
    |> Map.get(:moves)
    |> Enum.find_value({:error, "Move #{move} not found"}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end
end
