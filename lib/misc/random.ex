defmodule Misc.Random do
  @moduledoc """
  This is a very thin wrapper around Erlang's rand:uniform method. It allows
  you to create random strings or numbers.
  """

  @alphabet "abcdefghijklmnopqrstuvwxyz" <>
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ" <>
            "0123456789"

  @doc """
  Generated a random string with 8 characters which can be any of the a-Z, A-Z & 0-9.

  ## Examples

      iex> Misc.Random.string()
      "aqNC3xTM"

  """
  @spec string() :: String.t
  def string do
    string(8)
  end

  @doc """
  Generated a random string with `length` characters which can be any of the a-Z, A-Z & 0-9.

  ## Examples

      iex> Misc.Random.string(10)
      "Rb5I7SD6LB"

  """
  @spec string(length :: pos_integer) :: String.t
  def string(length) do
    string(@alphabet, length)
  end

  @doc """
  Generated a random string with `length` characters which can be any of the `characters`.

  ## Examples

      iex> Misc.Random.string("abc", 8)
      "ababacaa"

  """
  @spec string(alphabet :: String.t, length :: pos_integer) :: String.t
  def string(alphabet, length) when length > 0 do
    l = String.length(alphabet)
    1..length
    |> Enum.map_join(fn _ -> String.at(alphabet, :rand.uniform(l) - 1) end)
  end
  def string(_alphabet, _length), do: ""

  @doc """
  Generates a random number with 8 digits.

  ## Examples

      iex> Misc.Random.number()
      85054381

  """
  @spec number() :: non_neg_integer
  def number do
    number(8)
  end

  @doc """
  Generates a random number with `length` digits. If the `length` is invalid, then it will return `nil`.

  ## Examples

      iex> Misc.Random.number(10)
      8235498221

  """
  @spec number(length :: pos_integer) :: non_neg_integer | nil
  def number(1) do
    :rand.uniform(10) - 1
  end
  def number(length) when length > 1 do
    1..length - 1
    |> Enum.map(fn _ -> :rand.uniform(10) - 1 end)
    # Make sure the first digit is non-zero
    |> List.insert_at(0, :rand.uniform(9))
    |> Integer.undigits()
  end
  def number(_), do: nil

end
