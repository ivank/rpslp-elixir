defmodule Game.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  @type_name :user_scopes

  def change do
    execute(
      "CREATE TYPE #{@type_name} AS ENUM ('admin')",
      "DROP TYPE #{@type_name}"
    )

    create table(:users) do
      add :username, :string
      add :email, :string
      add :scopes, {:array, @type_name}

      timestamps()
    end
  end
end
