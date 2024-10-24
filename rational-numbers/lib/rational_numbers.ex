defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) when a2 < 0 and a2 * -1 == a1 and b1 == b2 do
    {0, 1}
  end

  def add(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    {a1 * b2 + a2 * b1, b1 * b2}
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) when a1 == a2 and b1 == b2 do
    {0, 1}
  end

  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) when a2 < 0 or b2 < 0 do
    reduce({a1 * b2 * -1, a2 * b1 * -1})
  end

  def divide_by({a1, b1}, {a2, b2}) when a2 != 0 do
    reduce({a1 * b2, a2 * b1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, b1}) do
    reduce({Kernel.abs(a1), Kernel.abs(b1)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) when n >= 0 do
    {a1, b1} = reduce(a)
    {a1 ** n, b1 ** n}
  end

  def pow_rational(a, n) when n < 0 do
    {a1, b1} = reduce(a)

    {a1, b1} =
      case rem(n, 2) do
        0 -> {a1, b1}
        _ -> {a1 * -1, b1 * -1}
      end

    {b1 ** Kernel.abs(n), a1 ** Kernel.abs(n)}
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a, b} = n
    x ** (a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms

  """
  @spec reduce(a :: rational) :: rational
  def reduce({a1, b1}) do
    {a1, b1} =
      case b1 < 0 do
        true -> {a1 * -1, b1 * -1}
        _ -> {a1, b1}
      end

    gcd = gcd(a1, b1)

    a1 = div(a1, gcd)
    b1 = div(b1, gcd)

    {a1, b1}
  end

  defp gcd(a, 0), do: Kernel.abs(a)
  defp gcd(a, b), do: gcd(b, rem(a, b))
end
