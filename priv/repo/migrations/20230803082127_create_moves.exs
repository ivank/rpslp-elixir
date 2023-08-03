defmodule Game.Repo.Migrations.CreateMoves do
  use Ecto.Migration

  @type_name :move_figure

  def change do
    execute(
      "CREATE TYPE #{@type_name} AS ENUM ('rock', 'paper', 'scissors', 'lizard', 'spock')",
      "DROP TYPE #{@type_name}"
    )

    create table(:moves) do
      add :figure, @type_name
      add :play_id, references(:plays, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:moves, [:play_id])
    create index(:moves, [:user_id])
  end
end
