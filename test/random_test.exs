defmodule Misc.RandomTest do
  use ExUnit.Case

  test "generated string is random" do
    string1 = Misc.Random.string()
    string2 = Misc.Random.string()
    assert string1 != string2
  end

  test "generated string returns a string" do
    string = Misc.Random.string()
    assert String.valid?(string)
  end

  test "generated strings have proper length" do
    for length <- 0..100 do
      string = Misc.Random.string(length)
      assert String.length(string) == length
    end
  end

  test "generated string contains characters from specified chracters only" do
    alphabet = "abcABC123"
    string = Misc.Random.string(alphabet, 1000)
    for c <- String.split(string, "") do
      assert String.contains?(alphabet, c), "#{alphabet} does not contain the #{c}"
    end
  end

  test "generated number is random" do
    number1 = Misc.Random.number()
    number2 = Misc.Random.number()
    assert number1 != number2
  end

  test "generated number returns a number" do
    number = Misc.Random.number()
    assert is_number(number)
  end

  test "generated number with length=0 returns nil" do
    number = Misc.Random.number(0)
    assert number == nil
  end

  test "generated numbers have proper length" do
    for length <- 1..100 do
      number = Misc.Random.number(length)
      assert String.length(to_string(number)) == length
    end
  end

end
