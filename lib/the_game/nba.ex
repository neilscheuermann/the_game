defmodule TheGame.NBA do
  @moduledoc """
  TheGame.NBA keeps the context that finds and reports live games
  """

  alias TheGame.NBADataService

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(TheGame.PubSub, @topic)
  end

  def broadcast_change(event, data) do
    Phoenix.PubSub.broadcast(TheGame.PubSub, @topic, {event, data})
  end

  def find_live_close_games() do
    todays_date = get_current_date()

    {:ok, todays_games} = NBADataService.fetch_daily_games(todays_date)

    live_games =
      todays_games
      |> Enum.filter(&is_live_game/1)

    broadcast_change(:fifteen_second_update, live_games)

    live_games
  end

  defp is_live_game(%{"isGameActivated" => true}), do: true

  defp is_live_game(_), do: false

  defp get_current_date() do
    {:ok, pacific_date_time} =
      DateTime.utc_now()
      |> DateTime.shift_zone("America/Los_Angeles")

    get_formatted_date(pacific_date_time)
  end

  # Returns a formatted YYYYMMDD string
  defp get_formatted_date(date) do
    date
    |> DateTime.to_iso8601(:basic)
    |> String.slice(0..7)
  end
end
