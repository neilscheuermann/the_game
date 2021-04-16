defmodule TheGame.NBAGame do
  @moduledoc """
  Sets the NBAGame struct
  """
  defstruct [
    :clock,
    :current_period,
    :h_team_logo_svg,
    :h_team_loss,
    :h_team_score,
    :h_team_tricode,
    :h_team_url_city,
    :h_team_url_name,
    :h_team_win,
    :is_halftime,
    :point_diff,
    :start_time_eastern,
    :v_team_logo_svg,
    :v_team_loss,
    :v_team_score,
    :v_team_tricode,
    :v_team_url_city,
    :v_team_url_name,
    :v_team_win
  ]

  def format_game(game, league_teams_data) do
    h_team_score = Map.get(game, "hTeam") |> Map.get("score")
    h_team_team_id = Map.get(game, "hTeam") |> Map.get("teamId")
    h_team_logo_svg = get_team_logo_svg(h_team_team_id)

    h_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == h_team_team_id end)

    h_team_url_name =
      h_team_meta
      |> Map.get("urlName")

    h_team_url_city =
      h_team_meta
      |> Map.get("city")
      |> lower_dash()

    v_team_score = Map.get(game, "vTeam") |> Map.get("score")
    v_team_team_id = Map.get(game, "vTeam") |> Map.get("teamId")
    v_team_logo_svg = get_team_logo_svg(v_team_team_id)

    v_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == v_team_team_id end)

    v_team_url_name =
      v_team_meta
      |> Map.get("urlName")

    v_team_url_city =
      v_team_meta
      |> Map.get("city")
      |> lower_dash()

    point_diff = get_point_diff(v_team_score, h_team_score)

    %TheGame.NBAGame{
      clock: Map.get(game, "clock"),
      current_period: Map.get(game, "period") |> Map.get("current"),
      h_team_logo_svg: h_team_logo_svg,
      h_team_loss: Map.get(game, "hTeam") |> Map.get("loss"),
      h_team_score: h_team_score,
      h_team_tricode: Map.get(game, "hTeam") |> Map.get("triCode"),
      h_team_url_city: h_team_url_city,
      h_team_url_name: h_team_url_name,
      h_team_win: Map.get(game, "hTeam") |> Map.get("win"),
      is_halftime: Map.get(game, "isHalftime"),
      point_diff: point_diff,
      start_time_eastern: Map.get(game, "startTimeEastern"),
      v_team_logo_svg: v_team_logo_svg,
      v_team_loss: Map.get(game, "vTeam") |> Map.get("loss"),
      v_team_score: v_team_score,
      v_team_tricode: Map.get(game, "vTeam") |> Map.get("triCode"),
      v_team_url_city: v_team_url_city,
      v_team_url_name: v_team_url_name,
      v_team_win: Map.get(game, "vTeam") |> Map.get("win")
    }
  end

  defp lower_dash(string) do
    string
    |> String.split(" ")
    |> Enum.join("-")
    |> String.downcase()
  end

  defp get_team_logo_svg(team_id) do
    "https://cdn.nba.com/logos/nba/#{team_id}/primary/L/logo.svg"
  end

  defp get_point_diff(score_a, score_b) when score_a === "" or score_b === "" do
    nil
  end

  defp get_point_diff(score_a, score_b) do
    {score_a, _} = Integer.parse(score_a)
    {score_b, _} = Integer.parse(score_b)

    abs(score_a - score_b)
  end
end
