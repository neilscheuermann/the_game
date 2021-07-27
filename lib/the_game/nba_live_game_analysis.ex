defmodule TheGame.NBALiveGameAnalysis do
  @moduledoc """
  Schedules when to start the 15 second intervals for live game
  analysis.  
  """

  require Logger

  use GenServer

  alias TheGame.{
    DateService,
    NBA,
    NBADataService,
    NBALiveGameAnalysis
  }

  @fifteen_second_interval_ms 15 * 1000

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    Logger.info("Gen server started>>>>")

    schedule_next_live_game_analysis_start()
    {:ok, state}
  end

  @impl true
  def handle_info(:analyze, state) do
    current_games = NBA.find_and_broadcast_games()

    if games_are_still_live?(current_games) do
      Process.send_after(self(), :analyze, @fifteen_second_interval_ms)
    else
      schedule_next_live_game_analysis_start()
    end

    {:noreply, state}
  end

  def calculate_start_delay(now_datetime, first_game_start_time_utc) do
    now_datetime
    |> Timex.diff(first_game_start_time_utc, :milliseconds)
    |> abs()
  end

  # Shifts a formatted date. Ex: "20210731" -> "20210801"
  def shift_by_a_day(date) do
    formatted_date_string =
      String.slice(date, 0..3) <>
        "-" <> String.slice(date, 4..5) <> "-" <> String.slice(date, 6..7)

    shifted_date =
      formatted_date_string
      |> Date.from_iso8601!()
      |> Timex.shift(days: 1)
      |> Date.to_string()
      |> String.replace("-", "")
  end

  defp first_game_on_date(formatted_date) do
    {:ok, games} = NBADataService.fetch_current_scoreboard_for_day(formatted_date)

    List.first(games)
  end

  defp find_next_first_game_start_time_utc() do
    # Temp: just return the start date if we're in the off season.
    if false do
      {:ok, season_2022_start_date_utc, _} = DateTime.from_iso8601("2021-10-19 23:00:00Z")
      season_2022_start_date_utc
    else
      current_date_yyyymmdd = DateService.get_current_formatted_date()
      {:ok, calendar} = NBADataService.fetch_calendar()

      {:ok, first_game_start_time_utc, _} =
        calendar
        |> next_date_with_games(current_date_yyyymmdd)
        |> first_game_on_date()
        |> Map.get("startTimeUTC")
        |> DateTime.from_iso8601()

      first_game_start_time_utc
    end
  end

  defp games_are_still_live?(current_games) do
    current_games
    |> Enum.any?(fn game -> Map.get(game, "statusNum") == 2 end)
  end

  # returns as formatted "20210708"
  defp next_date_with_games(calendar, formatted_date) do
    date_has_games_scheduled = Map.get(calendar, formatted_date) > 0

    if date_has_games_scheduled do
      formatted_date
    else
      next_date_with_games(calendar, shift_by_a_day(formatted_date))
    end
  end

  defp in_the_offseason?() do
    current_utc = Timex.now()
    {:ok, season_2021_end_date_utc, _} = DateTime.from_iso8601("2021-07-20 00:00:00Z")
    {:ok, season_2022_start_date_utc, _} = DateTime.from_iso8601("2021-10-19 23:00:00Z")

    DateTime.compare(current_utc, season_2021_end_date_utc) == :gt &&
      DateTime.compare(current_utc, season_2022_start_date_utc) == :lt
  end

  defp schedule_next_live_game_analysis_start() do
    # 1. Get next game start datetime
    first_game_start_time_utc = find_next_first_game_start_time_utc()

    # 2. Get milliseconds comparing to current datetime
    start_delay_ms = calculate_start_delay(Timex.now(), first_game_start_time_utc)

    Logger.info(
      "Next live analysis will start after #{start_delay_ms / 60 / 60 / 1000} hours, at #{
        DateTime.shift_zone!(first_game_start_time_utc, "America/New_York")
      } >>>>"
    )

    # 3. Set interval for first analyze
    Process.send_after(self(), :analyze, start_delay_ms)
  end
end
