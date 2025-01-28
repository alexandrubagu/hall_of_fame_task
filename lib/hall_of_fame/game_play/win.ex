defmodule HallOfFame.GamePlay.Win do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wins" do
    field :amount, :decimal
    field :user_id, :id
    field :game_id, :id
    field :bet_id, :id
    field :session_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(win, attrs) do
    win
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
