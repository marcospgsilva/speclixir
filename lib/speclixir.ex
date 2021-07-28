defmodule Speclixir do
  @moduledoc """
  Speclixir keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def get_status, do: Speclixir.Server.get_status()
  def start_process, do: Speclixir.Server.start_process()
end
