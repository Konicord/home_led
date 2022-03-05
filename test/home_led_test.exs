defmodule HomeLedTest do
  use ExUnit.Case
  doctest HomeLed

  test "greets the world" do
    assert HomeLed.hello() == :world
  end
end
