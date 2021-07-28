defmodule SpeclixirWeb.PageLive do
  use SpeclixirWeb, :live_view

  @impl true
  def mount(_params, _session, socket),
    do: {:ok, assign(socket, results: "")}

  @impl true
  def handle_event("get_state", _, socket),
    do: {:noreply, assign(socket, results: [get_state()])}

  @impl true
  def handle_event("send_message", _, socket) do
    send(SpecServer, "message")
    {:noreply, socket}
  end

  @impl true
  def handle_event("start_proc", _, socket) do
    start_proc()
    {:noreply, socket}
  end

  defp get_state(), do: Speclixir.get_status() |> inspect()

  defp start_proc(), do: Speclixir.start_process()
end
