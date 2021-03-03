defmodule ShoreChallenge.Game do
  @moduledoc """
  Game structure
  """
  defstruct frames: [], id: 0, score: 0, throw: 1, strike: nil, spare: nil, finished: false

  defmodule Strike do
    @moduledoc false
    defstruct first_score: 0, second_score: 0
  end

  defmodule Spare do
    @moduledoc false
    defstruct first_score: 0
  end

  defmodule Frame do
    @moduledoc false
    defstruct score: 0
  end
end
