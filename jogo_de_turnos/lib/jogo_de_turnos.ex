defmodule JogoDeTurnos do
  alias JogoDeTurnos.Game.Actions
  alias JogoDeTurnos.Game.Status
  alias JogoDeTurnos.{GameAgent, Player}

  @computer_name "Computador"
  @computer_moves [:attack_avg, :attack_rnd, :self_heal]

  def create_player(name, attack_avg, attack_rnd, self_heal) do
    Player.build(name, attack_avg, attack_rnd, self_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> GameAgent.start(player)

    Status.print_round_message(GameAgent.info())
  end

  def make_move(move) do
    GameAgent.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(GameAgent.info())

  defp handle_status(_other, move) do
    move
    |> Actions.get_move()
    |> execute_move()

    Status.print_round_message(GameAgent.info())

    computer_move(GameAgent.info())
  end

  defp execute_move({:error, move}), do: Status.print_wrong_move(move)

  defp execute_move({:ok, :attack_avg}), do: Actions.attack(:attack_avg)
  defp execute_move({:ok, :attack_rnd}), do: Actions.attack(:attack_rnd)
  defp execute_move({:ok, :self_heal}), do: Actions.heal()

  defp computer_move(%{turn: :computer, status: :continue}) do
    {:ok, Enum.random(@computer_moves)}
    |> execute_move()

    Status.print_round_message(GameAgent.info())
  end

  defp computer_move(_), do: :ok
end
