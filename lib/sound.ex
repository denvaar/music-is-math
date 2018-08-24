defmodule Synth.Sound do
  def read_music_data(music_data) do
    music_data                   # map of music staff
    |> Synth.Note.build()        # array of note maps
    |> Synth.SoX.change_to_command_args()  # array of strings
    |> Synth.SoX.spawn_commands()      # array of process statuses
  end
end
