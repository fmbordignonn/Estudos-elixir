defmodule JogoDeTurnos.Player do
  # Variável de módulo, tipo uma constante
  # Pra não precisar ficar repetindo as chaves em enforce_keys e defstruct
  @keys [:name, :life, :moves]

  @max_life 100

  @enforce_keys @keys
  defstruct @keys

  def build(name, attack_avg, attack_rnd, self_heal) do
    %JogoDeTurnos.Player{
      name: name,
      life: @max_life,
      moves: %{
        attack_avg: attack_avg,
        attack_rnd: attack_rnd,
        self_heal: self_heal
      }
    }
  end
end
