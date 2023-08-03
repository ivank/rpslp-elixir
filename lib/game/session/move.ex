defmodule Game.Session.Move do
  use Ecto.Schema
  import Ecto.Changeset

  schema "moves" do
    field :figure, Ecto.Enum, values: [:rock, :paper, :scissors, :lizard, :spock]

    belongs_to :play, Game.Session.Play
    belongs_to :user, Game.Profile.User

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, [:figure])
    |> validate_required([:figure])
  end
end
