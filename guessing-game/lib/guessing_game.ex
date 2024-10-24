defmodule GuessingGame do
  def compare(secret_number, guess \\ nil)

  def compare(secret_number, guess) when is_integer(secret_number) and is_integer(guess) do
    compare_numbers(secret_number, guess)
  end

  def compare(_secret_number, _guess) do
    "Make a guess"
  end

  defp compare_numbers(secret_number, guess) when secret_number == guess do
    "Correct"
  end

  defp compare_numbers(secret_number, guess)
       when guess > secret_number and guess - secret_number > 2 do
    "Too high"
  end

  defp compare_numbers(secret_number, guess)
       when secret_number > guess and secret_number - guess > 2 do
    "Too low"
  end

  defp compare_numbers(secret_number, guess) when secret_number - guess < 2 do
    "So close"
  end
end
