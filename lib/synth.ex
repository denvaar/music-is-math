defmodule Synth do
  @moduledoc """
  Documentation for Synth.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Synth.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
  Play sounds.

  ## Examples

      # Play a middle C note
      iex> Synth.play({:note, "c4"})
      :ok

      # play a C chord
      iex> Synth.play({:chord, ["c4", "e4", "f4"]})
      :ok
  """
  def play({:note, note}) do
    :ok
  end

  def play({:chord, notes}) do
    :ok
  end

  def play(_), do: {:error, "Unknown arguments"}

  def load(json_data) do
    music_data =
      json_data
      |> Poison.decode!()

    Synth.Sound.build_command(music_data)
    # tempo = music_data["staff"]["tempo"]
    # notes = music_data["staff"]["notes"]

    # notes
    # |> Enum.map(fn note_obj -> [String.capitalize(note_obj["freq"]] end)
  end
end
