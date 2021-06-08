defmodule TheGame.NBA do
  @moduledoc """
  TheGame.NBA keeps the context that finds and reports games
  """

  alias TheGame.{
    DateService,
    NBAGame,
    NBADataService
  }

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(TheGame.PubSub, @topic)
  end

  def broadcast_change(event, data) do
    Phoenix.PubSub.broadcast(TheGame.PubSub, @topic, {event, data})
  end

  def find_and_broadcast_games() do
    days_games = get_days_games()

    days_games
    |> Enum.filter(&(&1.game_status == :live))
    |> TheGame.Notifications.send_live_game_notifications(:nba)

    # IO.inspect("BROADCASTING GAMES>>>")
    broadcast_change(:fifteen_second_update, days_games)
  end

  def get_days_games() do
    todays_date = DateService.get_current_date("America/Los_Angeles")

    todays_games =
      case NBADataService.fetch_current_scoreboard_for_day(todays_date) do
        {:ok, todays_games} -> todays_games
        # Will this cause the page to go blank for the 15 second interval,
        # until the next analysis runs? Better than crashing the app I guess,
        # but I would like it to retry when it fails, instead of only returning
        # no data.
        {:error, _} -> []
      end

    league_teams_data = TheGame.NBADataService.fetch_team_data()
    league_standings_data = TheGame.NBADataService.fetch_team_standings_data()

    todays_games
    |> format_games(league_teams_data, league_standings_data)

    # # MOCKS
    # [
    #   TheGame.Seeds.live_game(),
    #   TheGame.Seeds.live_game_end_of_3rd_period(),
    #   TheGame.Seeds.live_game_at_halftime(),
    #   TheGame.Seeds.live_game_overtime_double(),
    #   TheGame.Seeds.live_game_end_of_4th_period(),
    #   TheGame.Seeds.completed_game(),
    #   TheGame.Seeds.upcoming_game()
    # ]
    # |> format_games(league_teams_data, league_standings_data)
  end

  def conference_standings(days_games) do
    case NBADataService.fetch_conference_standings_data() do
      {:ok, conference_standings} ->
        # # MOCKS
        # conference_standings = TheGame.LeagueConferenceStandingsMocks.conference_standings()

        TheGame.NBAStandingTile.format_standings(conference_standings, days_games)

      # Will this cause the page to go blank for the 15 second interval,
      # until the next analysis runs? Better than crashing the app I guess,
      # but I would like it to retry when it fails, instead of only returning
      # no data.
      {:error, _} ->
        %{east: [], west: []}
    end
  end

  defp format_games(games, league_teams_data, league_standings_data) do
    Enum.map(games, fn game ->
      NBAGame.format_game(game, league_teams_data, league_standings_data)
    end)
  end
end
