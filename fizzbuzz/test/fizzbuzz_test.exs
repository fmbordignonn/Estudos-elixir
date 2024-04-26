defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "readFile/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, 5, 7, :fizz, 10, :fizzbuzz, :fizz, 20]}

      assert FizzBuzz.readFile("numbers.txt") == expected_response
    end

    test "when an invalid file is provided, returns the converted list" do
      expected_response = {:error, "xii deu erro enoent"}

      assert FizzBuzz.readFile("invalid.txt") == expected_response
    end
  end
end
