defmodule Game.SessionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Game.Session` context.
  """

  @doc """
  Generate a lobby.
  """
  def lobby_fixture(attrs \\ %{}) do
    {:ok, lobby} =
      attrs
      |> Enum.into(%{
        slug: "some slug"
      })
      |> Game.Session.create_lobby()

    lobby
  end

  @doc """
  Generate a play.
  """
  def play_fixture(attrs \\ %{}) do
    {:ok, play} =
      attrs
      |> Enum.into(%{
        lobby_id: 42
      })
      |> Game.Session.create_play()

    play
  end

  @doc """
  Generate a move.
  """
  def move_fixture(attrs \\ %{}) do
    {:ok, move} =
      attrs
      |> Enum.into(%{
        figure: :rock,
        play_id: 42,
        user_id: 42
      })
      |> Game.Session.create_move()

    move
  end
end
