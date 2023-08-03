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
        name: "some name"
      })
      |> Game.Profile.create_user()

    user
  end
end
