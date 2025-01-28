defmodule HallOfFameWeb.WinController do
  use HallOfFameWeb, :controller

  alias HallOfFame.GamePlay
  alias HallOfFame.GamePlay.Win

  action_fallback HallOfFameWeb.FallbackController

  def index(conn, _params) do
    wins = GamePlay.list_wins()
    render(conn, :index, wins: wins)
  end

  def create(conn, %{"win" => win_params}) do
    with {:ok, %Win{} = win} <- GamePlay.create_win(win_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/wins/#{win}")
      |> render(:show, win: win)
    end
  end

  def show(conn, %{"id" => id}) do
    win = GamePlay.get_win!(id)
    render(conn, :show, win: win)
  end

  def update(conn, %{"id" => id, "win" => win_params}) do
    win = GamePlay.get_win!(id)

    with {:ok, %Win{} = win} <- GamePlay.update_win(win, win_params) do
      render(conn, :show, win: win)
    end
  end

  def delete(conn, %{"id" => id}) do
    win = GamePlay.get_win!(id)

    with {:ok, %Win{}} <- GamePlay.delete_win(win) do
      send_resp(conn, :no_content, "")
    end
  end
end
