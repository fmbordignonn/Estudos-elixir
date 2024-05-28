defmodule JogoDeTurnos.Actions.Attack do
  alias JogoDeTurnos.Game.Status
  alias JogoDeTurnos.GameAgent
  # .. significa range
  @avg_attack_power 18..25
  @rnd_attack_power 10..35

  def attack(opponent_key, move) do
    damage = get_attack_power(move)

    opponent_key
    |> GameAgent.fetch_player_data()
    |> Map.get(:life)
    |> calculate_life(damage)
    |> update_opponent_life(opponent_key, damage)
  end

  defp get_attack_power(:attack_avg), do: Enum.random(@avg_attack_power)
  defp get_attack_power(:attack_rnd), do: Enum.random(@rnd_attack_power)

  defp calculate_life(life, damage) when life - damage < 0, do: 0
  defp calculate_life(life, damage), do: life - damage

  defp update_opponent_life(updated_life, opponent_key, damage) do
    opponent_key
    |> GameAgent.fetch_player_data()
    |> Map.put(:life, updated_life)
    |> update_game_agent(opponent_key, damage)
  end

  defp update_game_agent(updated_opponent_object, opponent_key, damage) do
    GameAgent.info()
    |> Map.put(opponent_key, updated_opponent_object)
    |> GameAgent.update()

    Status.print_move_executed_message(opponent_key, :attack, damage)
  end
end
