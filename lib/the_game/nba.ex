defmodule TheGame.NBA do
  @moduledoc """
  TheGame.NBA keeps the context that finds and reports live games
  """

  alias TheGame.{
    DateService,
    NBAGame,
    NBADataService,
    Seeds
  }

  @topic inspect(__MODULE__)

  @league_teams_data TheGame.NBADataService.fetch_team_data()
  @league_standings_data TheGame.NBADataService.fetch_team_standings_data()

  def subscribe do
    Phoenix.PubSub.subscribe(TheGame.PubSub, @topic)
  end

  def broadcast_change(event, data) do
    Phoenix.PubSub.broadcast(TheGame.PubSub, @topic, {event, data})
  end

  def find_and_broadcast_games() do
    days_games = get_days_games()

    broadcast_change(:fifteen_second_update, days_games)
  end

  def get_days_games() do
    todays_date = DateService.get_current_date("America/Los_Angeles")

    {:ok, todays_games} = NBADataService.fetch_daily_games(todays_date)

    live_games =
      todays_games
      |> Enum.filter(&is_live_game?/1)
      |> format_games()

    completed_games =
      todays_games
      |> Enum.filter(&is_completed_game?/1)
      |> format_games()

    upcoming_games =
      todays_games
      |> Enum.filter(&is_upcoming_game?/1)
      |> format_games()

    %{
      live_games: live_games,
      completed_games: completed_games,
      upcoming_games: upcoming_games
    }

    # MOCKS
    %{
      live_games: [Seeds.live_game()] |> format_games(),
      completed_games: [Seeds.live_game_end_of_period()] |> format_games(),
      upcoming_games: [Seeds.completed_game()] |> format_games()
    }
  end

  defp is_upcoming_game?(%{"statusNum" => 1}), do: true
  defp is_upcoming_game?(_), do: false

  defp is_live_game?(%{"statusNum" => 2}), do: true
  defp is_live_game?(_), do: false

  defp is_completed_game?(%{"statusNum" => 3}), do: true
  defp is_completed_game?(_), do: false

  defp format_games(games) do
    Enum.map(games, fn game ->
      NBAGame.format_game(game, @league_teams_data, @league_standings_data)
    end)
  end
end
