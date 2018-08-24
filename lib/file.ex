defmodule Synth.File do
  def play(path) do
    path
    |> read_file()
    |> Synth.Sound.read_music_data()
  end

  defp read_file(path) do
    case File.read(path) do
      {:ok, content} -> Poison.decode!(content)
      {:error, _reason} -> %{}
    end
  end
end
