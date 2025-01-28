defmodule HallOfFame.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :rtp, :decimal
      add :status, :string
      add :media, :string
      add :slug, :string
      add :themes, :string

      timestamps(type: :utc_datetime)
    end
  end
end
