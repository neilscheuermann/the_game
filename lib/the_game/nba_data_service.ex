defmodule TheGame.NBADataService do
  @moduledoc """
  TheGame.NBADataService keeps the contexts that interface with the NBA data endpoints

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def fetch_daily_games(date) do
    case HTTPoison.get("http://data.nba.net/prod/v1/#{date}/scoreboard.json") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, extract_games(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def fetch_game_play_by_play(date, game_id) do
    case HTTPoison.get(
           "http://data.nba.net/data/10s/json/cms/noseason/game/#{date}/#{game_id}/pbp_all.json"
         ) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def fetch_nba_endpoints() do
    case HTTPoison.get("http://data.nba.net/prod/v1/today.json") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def format_game_data(date, game) do
    # 1. Fetch play-by-play data and get most recent play
    {:ok, data} = NBADataService.fetch_game_play_by_play(date, game["gameId"])

    most_recent_play =
      data
      |> Map.get("sports_content")
      |> Map.get("game")
      |> Map.get("play")
      |> List.last()

    # 2. Extract data into %LiveNailbiter{} struct
    {home_score, _} = Integer.parse(Map.get(most_recent_play, "home_score"))
    {visitor_score, _} = Integer.parse(Map.get(most_recent_play, "visitor_score"))

    home_tricode =
      game
      |> Map.get("hTeam")
      |> Map.get("triCode")

    visitor_tricode =
      game
      |> Map.get("vTeam")
      |> Map.get("triCode")

    nailbiter = %{
      point_diff: abs(home_score - visitor_score),
      period: Map.get(most_recent_play, "period"),
      clock: Map.get(most_recent_play, "clock"),
      h_team: %{
        score: home_score,
        tricode: home_tricode
      },
      v_team: %{
        score: visitor_score,
        tricode: visitor_tricode
      }
    }
  end

  defp extract_games(body) do
    body |> Jason.decode!() |> Map.get("games")
  end
end
