defmodule HighScore do
  @default_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_score) do
    Map.merge(scores, %{name => score})
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name, score \\ @default_score) do
    Map.merge(scores, %{name => score})
  end

  def update_score(scores, name, score) do
    scores
    |> Map.update(name, score, &set_score(&1, score))
  end

  def set_score(current_score, score), do: current_score + score

  def get_players(scores) do
    Map.keys(scores)
  end
end
