defmodule ShoreChallenge.GamePool do
  @moduledoc """
  Stores games in ets sotrage and provide access.
  """
  use GenServer

  @t :games

  def init(arg) do
    :ets.new(@t, [
      :set,
      :public,
      :named_table,
      {:read_concurrency, true},
      {:write_concurrency, true}
    ])

    {:ok, arg}
  end

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def get(key) do
    case :ets.lookup(@t, key) do
      [] ->
        nil

      [{_key, value}] ->
        value
    end
  end

  def put(key, value) do
    :ets.insert(@t, {key, value})
  end
end
