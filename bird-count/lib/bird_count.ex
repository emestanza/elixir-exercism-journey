defmodule BirdCount do
  def today([head | _tail]) do
    head
  end

  def today([]) do
    nil
  end

  def increment_day_count([_head | tail] = list) do
    [today(list) + 1 | tail]
  end

  def increment_day_count([]) do
    [1]
  end

  def has_day_without_birds?([head | tail]) do
    head == 0 || has_day_without_birds?(tail)
  end

  def has_day_without_birds?([]) do
    false
  end

  def total([head | tail]) do
    head + total(tail)
  end

  def total([]) do
    0
  end

  def busy_days([head | tail]) do
    if head >= 5 do
      1 + busy_days(tail)
    else
      0 + busy_days(tail)
    end
  end

  def busy_days([]) do
    0
  end
end
