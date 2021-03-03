defmodule ShoreChallengeWeb.Router do
  use ShoreChallengeWeb, :router

  scope "/api", ShoreChallengeWeb do
    post("/new", BowlingController, :new)
    get("/score", BowlingController, :score)
    post("/roll", BowlingController, :roll)
  end
end
