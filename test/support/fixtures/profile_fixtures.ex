defmodule Game.ProfileFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Game.Profile` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        scopes: ["admin"],
        username: "some username"
      })
      |> Game.Profile.create_user()

    user
  end
end
