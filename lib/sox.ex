defmodule Synth.SoX do
  def change_to_command_args(notes) do
    notes
    |> Enum.map(&build_command_args/1)
  end

  def spawn_commands(command_args) do
    command_args
    |> Enum.map(&get_sleep_time/1)
    |> Enum.map(&spawn_command/1)
  end

  defp build_command_args(%{"type" => [_ | _] = types, "freq" => [_ | _] = frequencies}) do
    types
    |> Enum.zip(frequencies)
    |> Enum.map(&build_command_args/1)
  end

  defp build_command_args({type, freq}), do: build_command_args(%{"type" => type, "freq" => freq})

  defp build_command_args(%{"type" => note_type, "freq" => note_freq}) do
    "-qn synth #{note_type} sine #{note_freq} fade h 0.1 #{note_type} 0.1"
  end

  defp get_sleep_time(args) when is_list(args) do
    max_arg =
      args
      |> Enum.map(&get_sleep_time/1)
      |> Enum.min_by(fn {sleep_time, _arg} -> sleep_time end)

    {max_sleep_time, _} = max_arg

    new_args =
      args
      |> Enum.map(&get_sleep_time/1)
      |> Enum.map(fn {_, args} -> {0, args} end)

    {max_sleep_time, new_args}
  end

  defp get_sleep_time(arg) do
    sleep_time = arg
      |> String.split()
      |> Enum.fetch!(2)
      |> String.to_float()
      |> Kernel.*(1000)
      |> Kernel.trunc()

    {sleep_time, arg}
  end

  defp spawn_command({sleep_time, [_ | _] = args}) do
    args
    |> Enum.map(&spawn_command/1)

    :timer.sleep(sleep_time)
  end

  defp spawn_command({sleep_time, args}) do
    spawn(Synth.SoX, :execute_command, [String.split(args)])
    :timer.sleep(sleep_time)
  end

  def execute_command(command_args), do: System.cmd("play", command_args)
end
