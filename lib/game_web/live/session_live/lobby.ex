defmodule GameWeb.SessionLive.Lobby do
  use GameWeb, :live_view

  alias Game.Session

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"slug" => slug}, _, socket) do
    lobby = Session.get_full_lobby!(slug)
    {:noreply, socket |> assign(:page_title, "Game: #{lobby.slug}") |> assign(:lobby, lobby)}
  end
end
