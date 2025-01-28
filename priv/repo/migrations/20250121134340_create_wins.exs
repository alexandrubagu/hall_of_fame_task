defmodule HallOfFame.Repo.Migrations.CreateWins do
  use Ecto.Migration

  def change do
    create table(:wins) do
      add :amount, :decimal
      add :user_id, references(:users, on_delete: :nothing)
      add :game_id, references(:games, on_delete: :nothing)
      add :bet_id, references(:bets, on_delete: :nothing)
      add :session_id, references(:sessions, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:wins, [:user_id])
    create index(:wins, [:game_id])
    create index(:wins, [:bet_id])
    create index(:wins, [:session_id])
  end
end
