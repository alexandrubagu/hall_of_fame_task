defmodule HallOfFameWeb.WinJSON do
  alias HallOfFame.GamePlay.Win

  @doc """
  Renders a list of wins.
  """
  def index(%{wins: wins}) do
    %{data: for(win <- wins, do: data(win))}
  end

  @doc """
  Renders a single win.
  """
  def show(%{win: win}) do
    %{data: data(win)}
  end

  defp data(%Win{} = win) do
    %{
      id: win.id,
      amount: win.amount
    }
  end
end
