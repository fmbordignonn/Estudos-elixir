defmodule JogoDeTurnos do
  alias JogoDeTurnos.Game.Status
  alias JogoDeTurnos.{GameAgent, Player}

  @computer_name "Computador"

  def create_player(name, attack_avg, attack_rnd, self_heal) do
    Player.build(name, attack_avg, attack_rnd, self_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> GameAgent.start(player)

    Status.print_current_round_message()
  end
end
