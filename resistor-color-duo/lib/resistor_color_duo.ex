defmodule ResistorColorDuo do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    [first, second] = Enum.take(colors, 2)
    res = Integer.to_string(@colors[first]) <> Integer.to_string(@colors[second])
    String.to_integer(res)
  end
end
