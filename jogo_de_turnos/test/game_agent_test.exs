defmodule JogoDeTurnosTest.GameAgent do
  use ExUnit.Case

  alias JogoDeTurnos.{GameAgent, Player}

  describe("start/2") do
    test "starts the game" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      assert {:ok, _pid} = GameAgent.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns current game state" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      GameAgent.start(computer, player)

      expected_response = %{
        status: :game_start,
        player: %Player{
          name: "Jogador",
          life: 100,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        computer: %Player{
          name: "Computador",
          life: 100,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        turn: :player
      }

      assert GameAgent.info() == expected_response
    end
  end

  describe "update/1" do
    test "updates the current state" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      GameAgent.start(computer, player)

      expected_state = %{
        status: :game_start,
        player: %Player{
          name: "Jogador",
          life: 100,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        computer: %Player{
          name: "Computador",
          life: 100,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        turn: :player
      }

      assert GameAgent.info() == expected_state

      new_state = %{
        status: :game_start,
        player: %Player{
          name: "Jogador",
          life: 80,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        computer: %Player{
          name: "Computador",
          life: 50,
          moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
        },
        turn: :player
      }

      GameAgent.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert GameAgent.info() == expected_response
    end
  end

  describe "get_player/0" do
    test "retrieves the player" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      GameAgent.start(computer, player)

      expected_response = %Player{
        name: "Jogador",
        life: 100,
        moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
      }

      assert GameAgent.get_player() == expected_response
    end
  end

  describe "get_turn/0" do
    test "retrieves the current turn" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      GameAgent.start(computer, player)

      expected_response = :player

      assert GameAgent.get_turn() == expected_response
    end
  end

  describe "fetch_player_data/1" do
    test "retrieves the parameter player data" do
      player = Player.build("Jogador", :soco, :chute, :cura)
      computer = Player.build("Computador", :soco, :chute, :cura)

      GameAgent.start(computer, player)

      expected_response = %Player{
        name: "Computador",
        life: 100,
        moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
      }

      assert GameAgent.fetch_player_data(:computer) == expected_response
    end
  end
end
