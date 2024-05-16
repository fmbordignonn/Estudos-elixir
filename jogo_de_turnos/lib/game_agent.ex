defmodule JogoDeTurnos.GameAgent do
  use Agent

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

  def get_player, do: Map.get(info(), :player)
end
