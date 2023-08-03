defmodule Game.Session do
  @moduledoc """
  The Session context.
  """

  import Ecto.Query, warn: false
  alias Game.Repo

  alias Game.Session.Lobby

  @doc """
  Returns the list of lobbies.

  ## Examples

      iex> list_lobbies()
      [%Lobby{}, ...]

  """
  def list_lobbies do
    Repo.all(Lobby)
  end

  @doc """
  Gets a single lobby.

  Raises `Ecto.NoResultsError` if the Lobby does not exist.

  ## Examples

      iex> get_lobby!(123)
      %Lobby{}

      iex> get_lobby!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lobby!(id), do: Repo.get!(Lobby, id)

  @doc """
  Creates a lobby.

  ## Examples

      iex> create_lobby(%{field: value})
      {:ok, %Lobby{}}

      iex> create_lobby(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lobby(attrs \\ %{}) do
    %Lobby{}
    |> Lobby.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lobby.

  ## Examples

      iex> update_lobby(lobby, %{field: new_value})
      {:ok, %Lobby{}}

      iex> update_lobby(lobby, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lobby(%Lobby{} = lobby, attrs) do
    lobby
    |> Lobby.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lobby.

  ## Examples

      iex> delete_lobby(lobby)
      {:ok, %Lobby{}}

      iex> delete_lobby(lobby)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lobby(%Lobby{} = lobby) do
    Repo.delete(lobby)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lobby changes.

  ## Examples

      iex> change_lobby(lobby)
      %Ecto.Changeset{data: %Lobby{}}

  """
  def change_lobby(%Lobby{} = lobby, attrs \\ %{}) do
    Lobby.changeset(lobby, attrs)
  end

  alias Game.Session.Play

  @doc """
  Returns the list of plays.

  ## Examples

      iex> list_plays()
      [%Play{}, ...]

  """
  def list_plays do
    Repo.all(Play)
  end

  @doc """
  Gets a single play.

  Raises `Ecto.NoResultsError` if the Play does not exist.

  ## Examples

      iex> get_play!(123)
      %Play{}

      iex> get_play!(456)
      ** (Ecto.NoResultsError)

  """
  def get_play!(id), do: Repo.get!(Play, id)

  @doc """
  Creates a play.

  ## Examples

      iex> create_play(%{field: value})
      {:ok, %Play{}}

      iex> create_play(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_play(attrs \\ %{}) do
    %Play{}
    |> Play.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a play.

  ## Examples

      iex> update_play(play, %{field: new_value})
      {:ok, %Play{}}

      iex> update_play(play, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_play(%Play{} = play, attrs) do
    play
    |> Play.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a play.

  ## Examples

      iex> delete_play(play)
      {:ok, %Play{}}

      iex> delete_play(play)
      {:error, %Ecto.Changeset{}}

  """
  def delete_play(%Play{} = play) do
    Repo.delete(play)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking play changes.

  ## Examples

      iex> change_play(play)
      %Ecto.Changeset{data: %Play{}}

  """
  def change_play(%Play{} = play, attrs \\ %{}) do
    Play.changeset(play, attrs)
  end

  alias Game.Session.Move

  @doc """
  Returns the list of moves.

  ## Examples

      iex> list_moves()
      [%Move{}, ...]

  """
  def list_moves do
    Repo.all(Move)
  end

  @doc """
  Gets a single move.

  Raises `Ecto.NoResultsError` if the Move does not exist.

  ## Examples

      iex> get_move!(123)
      %Move{}

      iex> get_move!(456)
      ** (Ecto.NoResultsError)

  """
  def get_move!(id), do: Repo.get!(Move, id)

  @doc """
  Creates a move.

  ## Examples

      iex> create_move(%{field: value})
      {:ok, %Move{}}

      iex> create_move(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_move(attrs \\ %{}) do
    %Move{}
    |> Move.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a move.

  ## Examples

      iex> update_move(move, %{field: new_value})
      {:ok, %Move{}}

      iex> update_move(move, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_move(%Move{} = move, attrs) do
    move
    |> Move.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a move.

  ## Examples

      iex> delete_move(move)
      {:ok, %Move{}}

      iex> delete_move(move)
      {:error, %Ecto.Changeset{}}

  """
  def delete_move(%Move{} = move) do
    Repo.delete(move)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking move changes.

  ## Examples

      iex> change_move(move)
      %Ecto.Changeset{data: %Move{}}

  """
  def change_move(%Move{} = move, attrs \\ %{}) do
    Move.changeset(move, attrs)
  end
end
