defmodule Game.Session.Play do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plays" do
    belongs_to :lobby, Game.Session.Lobby

    has_many :moves, Game.Session.Move
    many_to_many :users, Game.Profile.User, join_through: Game.Session.Move

    timestamps()
  end

  @doc false
  def changeset(play, attrs) do
    play
    |> cast(attrs, [])
    |> validate_required([])
  end
end
