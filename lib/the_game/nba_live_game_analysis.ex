defmodule TheGame.NBALiveGameAnalysis do
  @moduledoc """
  Checks NBA scores every 15 seconds during game time, sends 
  out socket updates with live games, and determines if 
  close game notifications need to be sent out.
  """

  use GenServer

  alias TheGame.NBALiveGameAnalysis
  alias TheGame.NBA
  alias TheGame.NBADataService

  @fifteen_second_interval 15 * 1000

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    IO.inspect("Gen server started>>>")

    schedule_next_live_game_analysis_start()
    {:ok, state}
  end

  @impl true
  def handle_info(:analyze, state) do
    current_games = NBA.find_and_broadcast_games()

    if games_are_still_live?(current_games) do
      Process.send_after(self(), :analyze, @fifteen_second_interval)
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

  defp find_first_game_on_date(formatted_date) do
    {:ok, games} = NBADataService.fetch_current_scoreboard_for_day(formatted_date)

    List.first(games)
  end

  defp find_next_first_game_start_time_utc() do
    {:ok, endpoints} = NBADataService.fetch_nba_endpoints()

    current_date =
      endpoints
      |> Map.get("links")
      |> Map.get("currentDate")

    {:ok, calendar} = NBADataService.fetch_calendar()

    # returns as formatted "20210708"
    next_date_with_games = next_date_with_games(calendar, current_date)

    first_game = find_first_game_on_date(next_date_with_games)

    {:ok, first_game_start_time_utc, _} =
      first_game
      |> Map.get("startTimeUTC")
      |> DateTime.from_iso8601()

    first_game_start_time_utc
  end

  defp games_are_still_live?(current_games) do
    current_games
    |> Enum.any?(fn game -> Map.get(game, "statusNum") == 2 end)
  end

  defp next_date_with_games(calendar, date) do
    date_has_games_scheduled = Map.get(calendar, date) > 0

    if date_has_games_scheduled do
      date
    else
      next_date_with_games(calendar, shift_by_a_day(date))
    end
  end

  defp schedule_next_live_game_analysis_start() do
    # 1. Get next game start datetime
    first_game_start_time_utc = find_next_first_game_start_time_utc()

    # 2. Get milliseconds comparing to current datetime
    start_delay_ms = calculate_start_delay(Timex.now(), first_game_start_time_utc)

    # 3. Set interval for first analyze
    Process.send_after(self(), :analyze, start_delay_ms)
  end
end
