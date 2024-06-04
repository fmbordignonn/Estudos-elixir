defmodule JogoDeTurnos.Game.Actions do
  alias JogoDeTurnos.GameAgent
  alias JogoDeTurnos.Actions.{Attack, Heal}

  def get_move(move) do
    GameAgent.get_player()
    |> Map.get(:moves)
    |> Enum.find_value({:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end

  def attack(move) do
    case GameAgent.get_turn() do
      :player -> Attack.attack(:computer, move)
      :computer -> Attack.attack(:player, move)
    end
  end

  def heal do
    case GameAgent.get_turn() do
      :player -> Heal.heal(:player)
      :computer -> Heal.heal(:computer)
    end
  end
end
