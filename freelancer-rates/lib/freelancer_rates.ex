defmodule FreelancerRates do
  @daily_hours 8
  @monthly_days 22
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    hourly_rate * @daily_hours * 1.0
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    (daily_rate(hourly_rate) * @monthly_days)
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    (budget / (daily_rate(hourly_rate) |> apply_discount(discount))) |> get_first_decimal()
  end

  def get_first_decimal(float) do
    Float.floor(float * 10) / 10
  end
end
