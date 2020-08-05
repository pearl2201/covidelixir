defmodule CovidelixirTest do
  use ExUnit.Case
  doctest Covidelixir

  test "greets the world" do
    assert Covidelixir.hello() == :world
  end
end
