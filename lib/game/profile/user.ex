defmodule Game.Profile.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :scopes, {:array, Ecto.Enum}, values: [:admin]
    field :username, :string

    has_many :moves, Game.Session.Move
    many_to_many :plays, Game.Session.Play, join_through: Game.Session.Move

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :scopes])
    |> validate_required([:username, :email, :scopes])
  end
end
