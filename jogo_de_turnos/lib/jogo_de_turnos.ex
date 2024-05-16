defmodule JogoDeTurnos do
  alias JogoDeTurnos.Game.Actions
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

    Status.print_start_message()
  end

  def make_move(move) do
    Actions.get_move(move)
  end
end
