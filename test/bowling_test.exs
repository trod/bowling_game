defmodule ShoreChallenge.BowlingTest do
  use ExUnit.Case

  alias ShoreChallenge.Bowling

  test "should be able to score a game with all zeros" do
    game = Bowling.start()

    Bowling.roll(game, 1)

    Bowling.score(game)
  end
end
