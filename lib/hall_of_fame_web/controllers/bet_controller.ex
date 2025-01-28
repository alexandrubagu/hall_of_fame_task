defmodule HallOfFameWeb.BetController do
  use HallOfFameWeb, :controller

  alias HallOfFame.GamePlay
  alias HallOfFame.GamePlay.Bet

  action_fallback HallOfFameWeb.FallbackController

  def index(conn, _params) do
    bets = GamePlay.list_bets()
    render(conn, :index, bets: bets)
  end

  def create(conn, %{"bet" => bet_params}) do
    with {:ok, %Bet{} = bet} <- GamePlay.create_bet(bet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/bets/#{bet}")
      |> render(:show, bet: bet)
    end
  end

  def show(conn, %{"id" => id}) do
    bet = GamePlay.get_bet!(id)
    render(conn, :show, bet: bet)
  end

  def update(conn, %{"id" => id, "bet" => bet_params}) do
    bet = GamePlay.get_bet!(id)

    with {:ok, %Bet{} = bet} <- GamePlay.update_bet(bet, bet_params) do
      render(conn, :show, bet: bet)
    end
  end

  def delete(conn, %{"id" => id}) do
    bet = GamePlay.get_bet!(id)

    with {:ok, %Bet{}} <- GamePlay.delete_bet(bet) do
      send_resp(conn, :no_content, "")
    end
  end
end
