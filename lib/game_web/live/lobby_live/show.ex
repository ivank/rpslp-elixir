defmodule GameWeb.LobbyLive.Show do
  use GameWeb, :live_view

  alias Game.Session

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:lobby, Session.get_lobby!(id))}
  end

  defp page_title(:show), do: "Show Lobby"
  defp page_title(:edit), do: "Edit Lobby"
end
