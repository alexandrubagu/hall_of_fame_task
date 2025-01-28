defmodule HallOfFameWeb.BetJSON do
  alias HallOfFame.GamePlay.Bet

  @doc """
  Renders a list of bets.
  """
  def index(%{bets: bets}) do
    %{data: for(bet <- bets, do: data(bet))}
  end

  @doc """
  Renders a single bet.
  """
  def show(%{bet: bet}) do
    %{data: data(bet)}
  end

  defp data(%Bet{} = bet) do
    %{
      id: bet.id,
      amount: bet.amount
    }
  end
end
