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

  def fetch_team_data() do
    case HTTPoison.get("http://data.nba.net/prod/v2/2020/teams.json") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        extract_teams(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def fetch_team_standings_data() do
    case HTTPoison.get("http://data.nba.net/prod/v1/current/standings_all_no_sort_keys.json") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        extract_team_standings(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp extract_games(body) do
    body |> Jason.decode!() |> Map.get("games")
  end

  defp extract_teams(body) do
    body |> Jason.decode!() |> Map.get("league") |> Map.get("standard")
  end

  defp extract_team_standings(body) do
    body |> Jason.decode!() |> Map.get("league") |> Map.get("standard") |> Map.get("teams")
  end
end
