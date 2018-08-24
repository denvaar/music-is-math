defmodule Synth.Note do
  def build(music_data) do
    music_data
    |> Kernel.get_in(["staff", "notes"])
    |> Enum.map(&capitalize_note_frequencies/1)
    |> Enum.map(&convert_types_to_seconds/1)
  end

  defp convert_types_to_seconds(%{"freq" => _, "type" => [_head | _tail]} = note_data) do
    types =
      note_data
      |> Map.fetch!("type")
      |> Enum.map(&format_note_type/1)

    note_data
    |> Map.put("type", types)
  end

  defp convert_types_to_seconds(note_data) do
    note_data
    |> Map.update!("type", &format_note_type(&1))
  end

  defp format_note_type("eighth"), do: 0.001 * (60_000 / 100) / 2
  defp format_note_type("eighth rest"), do: 0.001 * (60_000 / 100) / 2
  defp format_note_type("quarter"), do: 0.001 * (60_000 / 100)
  defp format_note_type("half"), do: format_note_type("quarter") * 2 / 1
  defp format_note_type("whole"), do: format_note_type("quarter") * 4 / 1

  defp capitalize_note_frequencies(%{"freq" => [_head | _tail], "type" => _} = note_data) do
    frequencies =
      note_data
      |> Map.fetch!("freq")
      |> Enum.map(&String.capitalize/1)

    note_data
    |> Map.put("freq", frequencies)
  end

  defp capitalize_note_frequencies(note_data) do
    note_data
    |> Map.update!("freq", &String.capitalize(&1))
  end
end
