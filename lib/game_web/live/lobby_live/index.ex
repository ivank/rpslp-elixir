defmodule GameWeb.LobbyLive.Index do
  use GameWeb, :live_view

  alias Game.Session
  alias Game.Session.Lobby

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :lobbies, Session.list_lobbies())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Lobby")
    |> assign(:lobby, Session.get_lobby!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Lobby")
    |> assign(:lobby, %Lobby{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Lobbies")
    |> assign(:lobby, nil)
  end

  @impl true
  def handle_info({GameWeb.LobbyLive.FormComponent, {:saved, lobby}}, socket) do
    {:noreply, stream_insert(socket, :lobbies, lobby)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    lobby = Session.get_lobby!(id)
    {:ok, _} = Session.delete_lobby(lobby)

    {:noreply, stream_delete(socket, :lobbies, lobby)}
  end
end
