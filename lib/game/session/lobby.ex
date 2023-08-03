defmodule Game.Session.Lobby do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lobbies" do
    field :slug, :string

    has_many :plays, Game.Session.Play

    timestamps()
  end

  @doc false
  def changeset(lobby, attrs) do
    lobby
    |> cast(attrs, [:slug])
    |> validate_required([:slug])
  end
end
