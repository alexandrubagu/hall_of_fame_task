defmodule HallOfFame.GamePlayTest do
  use HallOfFame.DataCase

  alias HallOfFame.GamePlay

  describe "users" do
    alias HallOfFame.GamePlay.User

    import HallOfFame.GamePlayFixtures

    @invalid_attrs %{name: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert GamePlay.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert GamePlay.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", email: "some email"}

      assert {:ok, %User{} = user} = GamePlay.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GamePlay.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email"}

      assert {:ok, %User{} = user} = GamePlay.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = GamePlay.update_user(user, @invalid_attrs)
      assert user == GamePlay.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = GamePlay.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> GamePlay.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = GamePlay.change_user(user)
    end
  end

  describe "games" do
    alias HallOfFame.GamePlay.Game

    import HallOfFame.GamePlayFixtures

    @invalid_attrs %{status: nil, title: nil, rtp: nil, media: nil, slug: nil, themes: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert GamePlay.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert GamePlay.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{status: "some status", title: "some title", rtp: "120.5", media: "some media", slug: "some slug", themes: "some themes"}

      assert {:ok, %Game{} = game} = GamePlay.create_game(valid_attrs)
      assert game.status == "some status"
      assert game.title == "some title"
      assert game.rtp == Decimal.new("120.5")
      assert game.media == "some media"
      assert game.slug == "some slug"
      assert game.themes == "some themes"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GamePlay.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{status: "some updated status", title: "some updated title", rtp: "456.7", media: "some updated media", slug: "some updated slug", themes: "some updated themes"}

      assert {:ok, %Game{} = game} = GamePlay.update_game(game, update_attrs)
      assert game.status == "some updated status"
      assert game.title == "some updated title"
      assert game.rtp == Decimal.new("456.7")
      assert game.media == "some updated media"
      assert game.slug == "some updated slug"
      assert game.themes == "some updated themes"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = GamePlay.update_game(game, @invalid_attrs)
      assert game == GamePlay.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = GamePlay.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> GamePlay.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = GamePlay.change_game(game)
    end
  end

  describe "sessions" do
    alias HallOfFame.GamePlay.Session

    import HallOfFame.GamePlayFixtures

    @invalid_attrs %{}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert GamePlay.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert GamePlay.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{}

      assert {:ok, %Session{} = session} = GamePlay.create_session(valid_attrs)
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GamePlay.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{}

      assert {:ok, %Session{} = session} = GamePlay.update_session(session, update_attrs)
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = GamePlay.update_session(session, @invalid_attrs)
      assert session == GamePlay.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = GamePlay.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> GamePlay.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = GamePlay.change_session(session)
    end
  end

  describe "bets" do
    alias HallOfFame.GamePlay.Bet

    import HallOfFame.GamePlayFixtures

    @invalid_attrs %{amount: nil}

    test "list_bets/0 returns all bets" do
      bet = bet_fixture()
      assert GamePlay.list_bets() == [bet]
    end

    test "get_bet!/1 returns the bet with given id" do
      bet = bet_fixture()
      assert GamePlay.get_bet!(bet.id) == bet
    end

    test "create_bet/1 with valid data creates a bet" do
      valid_attrs = %{amount: "120.5"}

      assert {:ok, %Bet{} = bet} = GamePlay.create_bet(valid_attrs)
      assert bet.amount == Decimal.new("120.5")
    end

    test "create_bet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GamePlay.create_bet(@invalid_attrs)
    end

    test "update_bet/2 with valid data updates the bet" do
      bet = bet_fixture()
      update_attrs = %{amount: "456.7"}

      assert {:ok, %Bet{} = bet} = GamePlay.update_bet(bet, update_attrs)
      assert bet.amount == Decimal.new("456.7")
    end

    test "update_bet/2 with invalid data returns error changeset" do
      bet = bet_fixture()
      assert {:error, %Ecto.Changeset{}} = GamePlay.update_bet(bet, @invalid_attrs)
      assert bet == GamePlay.get_bet!(bet.id)
    end

    test "delete_bet/1 deletes the bet" do
      bet = bet_fixture()
      assert {:ok, %Bet{}} = GamePlay.delete_bet(bet)
      assert_raise Ecto.NoResultsError, fn -> GamePlay.get_bet!(bet.id) end
    end

    test "change_bet/1 returns a bet changeset" do
      bet = bet_fixture()
      assert %Ecto.Changeset{} = GamePlay.change_bet(bet)
    end
  end

  describe "wins" do
    alias HallOfFame.GamePlay.Win

    import HallOfFame.GamePlayFixtures

    @invalid_attrs %{amount: nil}

    test "list_wins/0 returns all wins" do
      win = win_fixture()
      assert GamePlay.list_wins() == [win]
    end

    test "get_win!/1 returns the win with given id" do
      win = win_fixture()
      assert GamePlay.get_win!(win.id) == win
    end

    test "create_win/1 with valid data creates a win" do
      valid_attrs = %{amount: "120.5"}

      assert {:ok, %Win{} = win} = GamePlay.create_win(valid_attrs)
      assert win.amount == Decimal.new("120.5")
    end

    test "create_win/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GamePlay.create_win(@invalid_attrs)
    end

    test "update_win/2 with valid data updates the win" do
      win = win_fixture()
      update_attrs = %{amount: "456.7"}

      assert {:ok, %Win{} = win} = GamePlay.update_win(win, update_attrs)
      assert win.amount == Decimal.new("456.7")
    end

    test "update_win/2 with invalid data returns error changeset" do
      win = win_fixture()
      assert {:error, %Ecto.Changeset{}} = GamePlay.update_win(win, @invalid_attrs)
      assert win == GamePlay.get_win!(win.id)
    end

    test "delete_win/1 deletes the win" do
      win = win_fixture()
      assert {:ok, %Win{}} = GamePlay.delete_win(win)
      assert_raise Ecto.NoResultsError, fn -> GamePlay.get_win!(win.id) end
    end

    test "change_win/1 returns a win changeset" do
      win = win_fixture()
      assert %Ecto.Changeset{} = GamePlay.change_win(win)
    end
  end
end
