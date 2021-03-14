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
    IO.inspect(event, label: "event>>>")
    IO.inspect(data, label: "data>>>")
    Phoenix.PubSub.broadcast(TheGame.PubSub, @topic, {event, data})
  end

  def find_live_close_games() do
    todays_date = get_formatted_date(DateTime.utc_now())

    # TODO: Use Timex to get current date in PDT timezone
    todays_date = "20210314"

    # 1. Get all today's games.
    {:ok, todays_games} = NBADataService.fetch_daily_games(todays_date)

    # 2. Find live games
    raw_live_games =
      todays_games
      |> Enum.filter(&is_live_game/1)

    # 3. Get data for each game and send to client
    # live_games =
    #   raw_live_games
    #   |> Enum.map(fn game -> NBADataService.format_game_data(todays_date, game) end)
    #   |> IO.inspect(label: "live_games>>>")

    # TEMP LIVE GAME RETURN
    live_games = [
      %{
        clock: "00:00",
        h_team: %{score: 104, tricode: "LAC"},
        period: "3",
        point_diff: 36,
        v_team: %{score: 68, tricode: "GSW"}
      },
      %{
        clock: "02:40",
        h_team: %{score: 108, tricode: "POR"},
        period: "4",
        point_diff: 13,
        v_team: %{score: 121, tricode: "PHX"}
      },
      %{
        clock: "07:38",
        h_team: %{score: 108, tricode: "SAC"},
        period: "4",
        point_diff: 17,
        v_team: %{score: 91, tricode: "HOU"}
      }
    ]

    # 4. Push live_nailbiter data through Subs to client
    broadcast_change(:fifteen_second_update, live_games)

    live_games
  end

  defp is_live_game(%{"isGameActivated" => true}), do: true

  defp is_live_game(_), do: false

  # Returns a formatted YYYYMMDD string
  defp get_formatted_date(date) do
    date
    |> DateTime.to_iso8601(:basic)
    |> String.slice(0..7)
  end
end
