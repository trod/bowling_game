defmodule ShoreChallengeWeb.BowlingController do
  use Phoenix.Controller

  alias ShoreChallenge.GamePool
  alias ShoreChallenge.Bowling

  import Plug.Conn

  def new(%Plug.Conn{} = conn, _params) do
    {:ok, pid} = ShoreChallenge.Bowling.start_link([])

    game_id = GamePool.get(pid)

    conn
    |> send_resp(200, game_id)
  end

  def score(%Plug.Conn{} = conn, %{"game_id" => game_id}) do
    pid = GamePool.get(game_id)
    score = Bowling.score(pid)

    conn
    |> send_resp(200, "#{score}")
  end

  def score(%Plug.Conn{} = conn, _params) do
    conn
    |> invalid_params_resp()
  end

  def roll(%Plug.Conn{} = conn, %{"game_id" => game_id, "score" => score}) do
    pid = GamePool.get(game_id)
    Bowling.add_roll(pid, String.to_integer(score))

    score = Bowling.score(pid)

    conn
    |> send_resp(200, "#{score}")
  end

  def roll(%Plug.Conn{} = conn, _params) do
    conn
    |> invalid_params_resp()
  end

  defp invalid_params_resp(conn) do
    conn
    |> send_resp(400, "Invalid params")
  end
end
