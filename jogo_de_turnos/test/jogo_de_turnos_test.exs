defmodule JogoDeTurnosTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias JogoDeTurnos.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        name: "Jogador",
        life: 100,
        moves: %{attack_avg: :soco, attack_rnd: :chute, self_heal: :cura}
      }

      assert JogoDeTurnos.create_player("Jogador", :soco, :chute, :cura) == expected_response
    end
  end

  describe "start_game/1" do
    test "when the game is started, a message is printed" do
      player = Player.build("Jogador", :soco, :chute, :cura)

      messages =
        capture_io(fn ->
          assert JogoDeTurnos.start_game(player) == :ok
        end)

      # =~ usa regex, procura na string o literal passado abaixo
      assert messages =~ "The game has started!"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Jogador", :soco, :chute, :cura)

      capture_io(fn ->
        JogoDeTurnos.start_game(player)
      end)

      :ok

      # da pra retornar tbm uma variavel, tipo
      # {:ok, player: player, a: 1, b: 2, c: 3}
      # e dentro de test capturar essa variavel, tipo

      # test 'algo ocorre', %{player: player} do ..... end
      # ai dentro do teste teria a variavel player pra usar como quisesse
    end

    test "player makes a valid movement, move is executed and computer plays too" do
      messages =
        capture_io(fn ->
          JogoDeTurnos.make_move(:soco)
        end)

      assert messages =~ "It's player turn"
      assert messages =~ "Player attacked computer"
      assert messages =~ "It's computer turn"
    end

    test "player makes an invalid movement, an error message is printed" do
      messages =
        capture_io(fn ->
          JogoDeTurnos.make_move(:invalido)
        end)

      assert messages =~ "Invalid movement: invalido"
    end
  end
end
