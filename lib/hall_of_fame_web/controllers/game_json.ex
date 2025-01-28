defmodule HallOfFameWeb.GameJSON do
  alias HallOfFame.GamePlay.Game

  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    %{data: for(game <- games, do: data(game))}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: data(game)}
  end

  defp data(%Game{} = game) do
    %{
      id: game.id,
      title: game.title,
      rtp: game.rtp,
      status: game.status,
      media: game.media,
      slug: game.slug,
      themes: game.themes
    }
  end
end
