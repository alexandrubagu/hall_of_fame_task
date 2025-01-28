defmodule HallOfFame.GamePlay.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :status, :string
    field :title, :string
    field :rtp, :decimal
    field :media, :string
    field :slug, :string
    field :themes, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :rtp, :status, :media, :slug, :themes])
    |> validate_required([:title, :rtp, :status, :media, :slug, :themes])
  end
end
