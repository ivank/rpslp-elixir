defmodule Game.SessionTest do
  use Game.DataCase

  alias Game.Session

  describe "lobbies" do
    alias Game.Session.Lobby

    import Game.SessionFixtures

    @invalid_attrs %{slug: nil}

    test "list_lobbies/0 returns all lobbies" do
      lobby = lobby_fixture()
      assert Session.list_lobbies() == [lobby]
    end

    test "get_lobby!/1 returns the lobby with given id" do
      lobby = lobby_fixture()
      assert Session.get_lobby!(lobby.id) == lobby
    end

    test "create_lobby/1 with valid data creates a lobby" do
      valid_attrs = %{slug: "some slug"}

      assert {:ok, %Lobby{} = lobby} = Session.create_lobby(valid_attrs)
      assert lobby.slug == "some slug"
    end

    test "create_lobby/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Session.create_lobby(@invalid_attrs)
    end

    test "update_lobby/2 with valid data updates the lobby" do
      lobby = lobby_fixture()
      update_attrs = %{slug: "some updated slug"}

      assert {:ok, %Lobby{} = lobby} = Session.update_lobby(lobby, update_attrs)
      assert lobby.slug == "some updated slug"
    end

    test "update_lobby/2 with invalid data returns error changeset" do
      lobby = lobby_fixture()
      assert {:error, %Ecto.Changeset{}} = Session.update_lobby(lobby, @invalid_attrs)
      assert lobby == Session.get_lobby!(lobby.id)
    end

    test "delete_lobby/1 deletes the lobby" do
      lobby = lobby_fixture()
      assert {:ok, %Lobby{}} = Session.delete_lobby(lobby)
      assert_raise Ecto.NoResultsError, fn -> Session.get_lobby!(lobby.id) end
    end

    test "change_lobby/1 returns a lobby changeset" do
      lobby = lobby_fixture()
      assert %Ecto.Changeset{} = Session.change_lobby(lobby)
    end
  end

  describe "plays" do
    alias Game.Session.Play

    import Game.SessionFixtures

    @invalid_attrs %{lobby_id: nil}

    test "list_plays/0 returns all plays" do
      play = play_fixture()
      assert Session.list_plays() == [play]
    end

    test "get_play!/1 returns the play with given id" do
      play = play_fixture()
      assert Session.get_play!(play.id) == play
    end

    test "create_play/1 with valid data creates a play" do
      valid_attrs = %{lobby_id: 42}

      assert {:ok, %Play{} = play} = Session.create_play(valid_attrs)
      assert play.lobby_id == 42
    end

    test "create_play/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Session.create_play(@invalid_attrs)
    end

    test "update_play/2 with valid data updates the play" do
      play = play_fixture()
      update_attrs = %{lobby_id: 43}

      assert {:ok, %Play{} = play} = Session.update_play(play, update_attrs)
      assert play.lobby_id == 43
    end

    test "update_play/2 with invalid data returns error changeset" do
      play = play_fixture()
      assert {:error, %Ecto.Changeset{}} = Session.update_play(play, @invalid_attrs)
      assert play == Session.get_play!(play.id)
    end

    test "delete_play/1 deletes the play" do
      play = play_fixture()
      assert {:ok, %Play{}} = Session.delete_play(play)
      assert_raise Ecto.NoResultsError, fn -> Session.get_play!(play.id) end
    end

    test "change_play/1 returns a play changeset" do
      play = play_fixture()
      assert %Ecto.Changeset{} = Session.change_play(play)
    end
  end

  describe "moves" do
    alias Game.Session.Move

    import Game.SessionFixtures

    @invalid_attrs %{figure: nil, play_id: nil, user_id: nil}

    test "list_moves/0 returns all moves" do
      move = move_fixture()
      assert Session.list_moves() == [move]
    end

    test "get_move!/1 returns the move with given id" do
      move = move_fixture()
      assert Session.get_move!(move.id) == move
    end

    test "create_move/1 with valid data creates a move" do
      valid_attrs = %{figure: :rock, play_id: 42, user_id: 42}

      assert {:ok, %Move{} = move} = Session.create_move(valid_attrs)
      assert move.figure == :rock
      assert move.play_id == 42
      assert move.user_id == 42
    end

    test "create_move/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Session.create_move(@invalid_attrs)
    end

    test "update_move/2 with valid data updates the move" do
      move = move_fixture()
      update_attrs = %{figure: :paper, play_id: 43, user_id: 43}

      assert {:ok, %Move{} = move} = Session.update_move(move, update_attrs)
      assert move.figure == :paper
      assert move.play_id == 43
      assert move.user_id == 43
    end

    test "update_move/2 with invalid data returns error changeset" do
      move = move_fixture()
      assert {:error, %Ecto.Changeset{}} = Session.update_move(move, @invalid_attrs)
      assert move == Session.get_move!(move.id)
    end

    test "delete_move/1 deletes the move" do
      move = move_fixture()
      assert {:ok, %Move{}} = Session.delete_move(move)
      assert_raise Ecto.NoResultsError, fn -> Session.get_move!(move.id) end
    end

    test "change_move/1 returns a move changeset" do
      move = move_fixture()
      assert %Ecto.Changeset{} = Session.change_move(move)
    end
  end

  describe "moves" do
    alias Game.Session.Move

    import Game.SessionFixtures

    @invalid_attrs %{figure: nil}

    test "list_moves/0 returns all moves" do
      move = move_fixture()
      assert Session.list_moves() == [move]
    end

    test "get_move!/1 returns the move with given id" do
      move = move_fixture()
      assert Session.get_move!(move.id) == move
    end

    test "create_move/1 with valid data creates a move" do
      valid_attrs = %{figure: :rock}

      assert {:ok, %Move{} = move} = Session.create_move(valid_attrs)
      assert move.figure == :rock
    end

    test "create_move/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Session.create_move(@invalid_attrs)
    end

    test "update_move/2 with valid data updates the move" do
      move = move_fixture()
      update_attrs = %{figure: :paper}

      assert {:ok, %Move{} = move} = Session.update_move(move, update_attrs)
      assert move.figure == :paper
    end

    test "update_move/2 with invalid data returns error changeset" do
      move = move_fixture()
      assert {:error, %Ecto.Changeset{}} = Session.update_move(move, @invalid_attrs)
      assert move == Session.get_move!(move.id)
    end

    test "delete_move/1 deletes the move" do
      move = move_fixture()
      assert {:ok, %Move{}} = Session.delete_move(move)
      assert_raise Ecto.NoResultsError, fn -> Session.get_move!(move.id) end
    end

    test "change_move/1 returns a move changeset" do
      move = move_fixture()
      assert %Ecto.Changeset{} = Session.change_move(move)
    end
  end

  describe "plays" do
    alias Game.Session.Play

    import Game.SessionFixtures

    @invalid_attrs %{}

    test "list_plays/0 returns all plays" do
      play = play_fixture()
      assert Session.list_plays() == [play]
    end

    test "get_play!/1 returns the play with given id" do
      play = play_fixture()
      assert Session.get_play!(play.id) == play
    end

    test "create_play/1 with valid data creates a play" do
      valid_attrs = %{}

      assert {:ok, %Play{} = play} = Session.create_play(valid_attrs)
    end

    test "create_play/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Session.create_play(@invalid_attrs)
    end

    test "update_play/2 with valid data updates the play" do
      play = play_fixture()
      update_attrs = %{}

      assert {:ok, %Play{} = play} = Session.update_play(play, update_attrs)
    end

    test "update_play/2 with invalid data returns error changeset" do
      play = play_fixture()
      assert {:error, %Ecto.Changeset{}} = Session.update_play(play, @invalid_attrs)
      assert play == Session.get_play!(play.id)
    end

    test "delete_play/1 deletes the play" do
      play = play_fixture()
      assert {:ok, %Play{}} = Session.delete_play(play)
      assert_raise Ecto.NoResultsError, fn -> Session.get_play!(play.id) end
    end

    test "change_play/1 returns a play changeset" do
      play = play_fixture()
      assert %Ecto.Changeset{} = Session.change_play(play)
    end
  end
end
