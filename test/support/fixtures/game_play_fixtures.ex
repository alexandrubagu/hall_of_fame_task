defmodule HallOfFame.GamePlayFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HallOfFame.GamePlay` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> HallOfFame.GamePlay.create_user()

    user
  end

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        media: "some media",
        rtp: "120.5",
        slug: "some slug",
        status: "some status",
        themes: "some themes",
        title: "some title"
      })
      |> HallOfFame.GamePlay.create_game()

    game
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{

      })
      |> HallOfFame.GamePlay.create_session()

    session
  end

  @doc """
  Generate a bet.
  """
  def bet_fixture(attrs \\ %{}) do
    {:ok, bet} =
      attrs
      |> Enum.into(%{
        amount: "120.5"
      })
      |> HallOfFame.GamePlay.create_bet()

    bet
  end

  @doc """
  Generate a win.
  """
  def win_fixture(attrs \\ %{}) do
    {:ok, win} =
      attrs
      |> Enum.into(%{
        amount: "120.5"
      })
      |> HallOfFame.GamePlay.create_win()

    win
  end
end
