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
    move
    |> Actions.get_move()
    |> execute_move()
  end

  defp execute_move({:error, move}), do: Status.print_wrong_move(move)

  # Consegui matar o case antes da aula heheheheheh

  defp execute_move({:ok, :attack_avg}), do: IO.puts("Ataque basico")
  defp execute_move({:ok, :attack_rnd}), do: IO.puts("Ataque pesado")
  defp execute_move({:ok, :self_heal}), do: IO.puts("Cura")
end
