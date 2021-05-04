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

    live_games =
      todays_games
      |> Enum.filter(&is_live_game?/1)
      |> format_games(league_teams_data, league_standings_data)

    completed_games =
      todays_games
      |> Enum.filter(&is_completed_game?/1)
      |> format_games(league_teams_data, league_standings_data)

    upcoming_games =
      todays_games
      |> Enum.filter(&is_upcoming_game?/1)
      |> format_games(league_teams_data, league_standings_data)

    %{
      live_games: live_games,
      completed_games: completed_games,
      upcoming_games: upcoming_games
    }

    # # MOCKS
    # %{
    #   live_games:
    #     [
    #       TheGame.Seeds.live_game(),
    #       TheGame.Seeds.live_game_end_of_3rd_period(),
    #       TheGame.Seeds.live_game_at_halftime(),
    #       TheGame.Seeds.live_game_overtime_double(),
    #       TheGame.Seeds.live_game_end_of_4th_period()
    #     ]
    #     |> format_games(league_teams_data, league_standings_data),
    #   completed_games:
    #     [TheGame.Seeds.completed_game()] |> format_games(league_teams_data, league_standings_data),
    #   upcoming_games:
    #     [TheGame.Seeds.upcoming_game(), TheGame.Seeds.upcoming_game_on_espn()]
    #     |> format_games(league_teams_data, league_standings_data)
    # }
  end

  def conference_standings() do
    conference_standings =
      case NBADataService.fetch_conference_standings_data() do
        {:ok, conference_standings} ->
          TheGame.NBAStandingTile.format_standings(conference_standings)

        # Will this cause the page to go blank for the 15 second interval,
        # until the next analysis runs? Better than crashing the app I guess,
        # but I would like it to retry when it fails, instead of only returning
        # no data.
        {:error, _} ->
          %{}
      end
  end

  defp is_upcoming_game?(%{"statusNum" => 1}), do: true
  defp is_upcoming_game?(_), do: false

  defp is_live_game?(%{"statusNum" => 2}), do: true
  defp is_live_game?(_), do: false

  defp is_completed_game?(%{"statusNum" => 3}), do: true
  defp is_completed_game?(_), do: false

  defp format_games(games, league_teams_data, league_standings_data) do
    Enum.map(games, fn game ->
      NBAGame.format_game(game, league_teams_data, league_standings_data)
    end)
  end
end
