defmodule TheGame.DateService do
  def get_current_date() do
    {:ok, date_time} = DateTime.utc_now()

    format_date(date_time)
  end

  def get_current_date(time_zone) do
    {:ok, date_time} =
      DateTime.utc_now()
      |> DateTime.shift_zone(time_zone)

    format_date(date_time)
  end

  # Returns a formatted YYYYMMDD string
  defp format_date(date) do
    date
    |> DateTime.to_iso8601(:basic)
    |> String.slice(0..7)
  end
end
