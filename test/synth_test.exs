defmodule SynthTest do
  use ExUnit.Case
  doctest Synth

  test "greets the world" do
    assert Synth.hello() == :world
  end

  test "plays a note" do
    assert Synth.play({:note, "c4"}) == :ok
  end

  test "plays a chord" do
    assert Synth.play({:chord, ["c4", "e4", "f4"]}) == :ok
  end

  test "Handles unknown arguments" do
    assert Synth.play({:other, ["c4"]}) == {:error, "Unknown arguments"}
  end

  test "parses JSON data" do
    assert Synth.load("{\"staff\": {}}") == %{"staff" => %{}}
  end
end
