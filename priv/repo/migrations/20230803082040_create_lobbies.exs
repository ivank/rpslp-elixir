defmodule Game.Repo.Migrations.CreateLobbies do
  use Ecto.Migration

  def change do
    create table(:lobbies) do
      add :slug, :string

      timestamps()
    end
  end
end
