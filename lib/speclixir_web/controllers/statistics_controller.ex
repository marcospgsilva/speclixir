defmodule SpeclixirWeb.StatisticsController do
  use SpeclixirWeb, :controller

  def show(conn, _) do
    statistics = Speclixir.get_status()

    conn
    |> render("show.json", %{statistics: statistics})
  end
end
