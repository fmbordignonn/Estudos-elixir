defmodule JogoDeTurnos.GameAgent do
  use Agent
  alias JogoDeTurnos.Player

  def start(computer, player) do
    game_start = %{
      computer: computer,
      player: player,
      turn: :player,
      status: :game_start
    }

    Agent.start_link(fn -> game_start end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1)
  end

  def update(state), do: Agent.update(__MODULE__, fn _ -> update_game_status(state) end)

  def get_player, do: Map.get(info(), :player)

  def get_turn, do: Map.get(info(), :turn)

  def fetch_player_data(player), do: Map.get(info(), player)

  defp update_game_status(
         %{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state
       )
       when player_life == 0 or computer_life == 0,
       do: Map.put(state, :status, :game_over)

  defp update_game_status(state) do
    state
    |> Map.put(:status, :continue)
    |> update_turn()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)
end
