defmodule HallOfFameWeb.GameControllerTest do
  use HallOfFameWeb.ConnCase

  import HallOfFame.GamePlayFixtures

  alias HallOfFame.GamePlay.Game

  @create_attrs %{
    status: "some status",
    title: "some title",
    rtp: "120.5",
    media: "some media",
    slug: "some slug",
    themes: "some themes"
  }
  @update_attrs %{
    status: "some updated status",
    title: "some updated title",
    rtp: "456.7",
    media: "some updated media",
    slug: "some updated slug",
    themes: "some updated themes"
  }
  @invalid_attrs %{status: nil, title: nil, rtp: nil, media: nil, slug: nil, themes: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, ~p"/api/games")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game" do
    test "renders game when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "media" => "some media",
               "rtp" => "120.5",
               "slug" => "some slug",
               "status" => "some status",
               "themes" => "some themes",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game" do
    setup [:create_game]

    test "renders game when data is valid", %{conn: conn, game: %Game{id: id} = game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "media" => "some updated media",
               "rtp" => "456.7",
               "slug" => "some updated slug",
               "status" => "some updated status",
               "themes" => "some updated themes",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game" do
    setup [:create_game]

    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete(conn, ~p"/api/games/#{game}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/games/#{game}")
      end
    end
  end

  defp create_game(_) do
    game = game_fixture()
    %{game: game}
  end
end
