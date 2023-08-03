defmodule Game.Repo.Migrations.CreatePlays do
  use Ecto.Migration

  def change do
    create table(:plays) do
      add :lobby_id, references(:lobbies, on_delete: :nothing)

      timestamps()
    end

    create index(:plays, [:lobby_id])
  end
end
