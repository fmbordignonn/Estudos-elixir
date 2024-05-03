defmodule JogoDeTurnos do
  alias JogoDeTurnos.Player, as: PlayerStruct

  def create_player(name, attack_avg, attack_rnd, self_heal) do
    PlayerStruct.build(name, attack_avg, attack_rnd, self_heal)
  end
end
