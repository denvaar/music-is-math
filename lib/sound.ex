defmodule Synth.Sound do
  def build_command(music_data) do
    command_arguments =
      music_data["staff"]["notes"]
      |> format_notes()
      |> build_commands()

    compose(music_data["staff"]["tempo"], command_arguments)
  end

  defp format_notes(notes) do
    notes
    |> Enum.map(&format_note/1)
  end

  defp format_note(note_hash) do
    %{"freq" => String.capitalize(note_hash["freq"]),
      "type" => format_note_type(100, note_hash["type"])}
  end

  defp format_note_type(qpm, "quarter"), do: 0.001 * (60_000 / qpm)
  defp format_note_type(qpm, "half"), do: format_note_type(qpm, "quarter") * 2
  defp format_note_type(qpm, "whole"), do: format_note_type(qpm, "quarter") * 4
  defp format_note_type(_, _), do: 1

  defp build_commands(notes) do
    notes
    |> Enum.map(fn note -> "-qn synth #{note["type"]} sine #{note["freq"]} fade h 0.1 #{note["type"]} 0.1" end)
  end

  defp compose(qpm, command_args) do
    sleep_time =
      (60_000 / qpm)
      |> Kernel.trunc()

    command_args
    |> Enum.map(&spawn_command(sleep_time, &1))
  end

  defp spawn_command(sleep_time, command_args) do
    split_args =
      command_args
      |> String.split()

    spawn(Synth.Sound, :execute_command, [split_args])
    :timer.sleep(Kernel.trunc(String.to_float(Enum.fetch!(split_args, 2)) * 1000))
  end

  def execute_command(command_arguments), do: System.cmd("play", command_arguments)

  # tempo 100 qpm
  # ms  |  type
  # -------------
  # 0.6 |  quarter
  # 1.2 |  half
  # 2.4 |  whole
  #
  # x * (60000 / 100) = 2.4
end
