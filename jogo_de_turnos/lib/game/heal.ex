defmodule JogoDeTurnos.Actions.Heal do
  alias JogoDeTurnos.Game.Status
  alias JogoDeTurnos.GameAgent

  @heal_move 18..25

  def heal(player) do
    player
    |> GameAgent.fetch_player_data()
    |> Map.get(:life)
    |> calculate_life()
    |> set_life(player)
  end

  defp calculate_life(life), do: Enum.random(@heal_move) + life

  defp set_life(life, player) when life > 100, do: update_player_life(player, 100)

  defp set_life(life, player), do: update_player_life(player, life)

  defp update_player_life(player, life) do
    player
    |> GameAgent.fetch_player_data()
    |> Map.put(:life, life)
    |> update_game(player, life)
  end

  defp update_game(player_object, player, life) do
    GameAgent.info()
    |> Map.put(player, player_object)
    |> GameAgent.update()

    Status.print_move_executed_message(player, :heal, life)
  end
end
