defmodule HallOfFameWeb.GameController do
  use HallOfFameWeb, :controller

  alias HallOfFame.GamePlay
  alias HallOfFame.GamePlay.Game

  action_fallback HallOfFameWeb.FallbackController

  def index(conn, _params) do
    games = GamePlay.list_games()
    render(conn, :index, games: games)
  end

  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- GamePlay.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/games/#{game}")
      |> render(:show, game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    game = GamePlay.get_game!(id)
    render(conn, :show, game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = GamePlay.get_game!(id)

    with {:ok, %Game{} = game} <- GamePlay.update_game(game, game_params) do
      render(conn, :show, game: game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = GamePlay.get_game!(id)

    with {:ok, %Game{}} <- GamePlay.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end
end
