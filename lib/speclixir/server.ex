defmodule Speclixir.Server do
  @moduledoc """
  Generic Server
  """
  use GenServer

  def start_link(_attrs),
    do: GenServer.start_link(__MODULE__, 0, name: SpecServer)

  def start_process() do
    GenServer.cast(SpecServer, {:start_proc})
  end

  def get_status do
    :sys.statistics(SpecServer, true)
    {:status, _pid, {_module, type}, [_, status, _, _state, _]} = :sys.get_status(SpecServer)

    {:ok, [{_, {{year, month, day}, _}}, _, _, {_, messages_in}, {_, messages_out}]} =
      :sys.statistics(SpecServer, :get)

    state = :sys.get_state(SpecServer)

    date = Date.new!(year, month, day) |> Date.to_iso8601()

    %Speclixir.Statistics{
      status: status,
      state: state |> inspect(),
      type: type,
      started_at: date,
      messages_in: messages_in,
      messages_out: messages_out
    }
  end

  @impl true
  def init(attrs), do: {:ok, attrs}

  @impl true
  def handle_info(_msg, state) do
    {:noreply, state}
  end

  @impl true
  def handle_cast({:start_proc}, state) do
    spawn(fn -> loop(2) end)
    {:noreply, state}
  end

  defp loop(value) do
    value * value
  end
end
