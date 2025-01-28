defmodule HallOfFameWeb.WinControllerTest do
  use HallOfFameWeb.ConnCase

  import HallOfFame.GamePlayFixtures

  alias HallOfFame.GamePlay.Win

  @create_attrs %{
    amount: "120.5"
  }
  @update_attrs %{
    amount: "456.7"
  }
  @invalid_attrs %{amount: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all wins", %{conn: conn} do
      conn = get(conn, ~p"/api/wins")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create win" do
    test "renders win when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/wins", win: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/wins/#{id}")

      assert %{
               "id" => ^id,
               "amount" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/wins", win: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update win" do
    setup [:create_win]

    test "renders win when data is valid", %{conn: conn, win: %Win{id: id} = win} do
      conn = put(conn, ~p"/api/wins/#{win}", win: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/wins/#{id}")

      assert %{
               "id" => ^id,
               "amount" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, win: win} do
      conn = put(conn, ~p"/api/wins/#{win}", win: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete win" do
    setup [:create_win]

    test "deletes chosen win", %{conn: conn, win: win} do
      conn = delete(conn, ~p"/api/wins/#{win}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/wins/#{win}")
      end
    end
  end

  defp create_win(_) do
    win = win_fixture()
    %{win: win}
  end
end
