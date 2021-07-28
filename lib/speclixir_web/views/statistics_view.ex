defmodule SpeclixirWeb.StatisticsView do
  use SpeclixirWeb, :view
  alias Speclixir.Statistics

  def render("show.json", %{statistics: %Statistics{} = statistics}) do
    %{
      status: statistics.status,
      state: statistics.state,
      abstraction_type: statistics.type,
      started_at: handle_date(statistics.started_at),
      messages_in: statistics.messages_in,
      messages_out: statistics.messages_out
    }
  end

  defp handle_date({year, month, day}),
    do:
      Date.new(year, month, day)
      |> elem(1)
end
