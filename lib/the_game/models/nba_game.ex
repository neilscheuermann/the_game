defmodule TheGame.NBAGame do
  @moduledoc """
  Sets the NBAGame struct
  """
  defstruct [
    :clock,
    :current_period,
    :h_team_logo_svg,
    :h_team_score,
    :h_team_tricode,
    :point_diff,
    :v_team_logo_svg,
    :v_team_score,
    :v_team_tricode
  ]

  def format_game(game) do
    h_team_score = Map.get(game, "hTeam") |> Map.get("score")
    h_team_team_id = Map.get(game, "hTeam") |> Map.get("teamId")
    h_team_logo_svg = get_team_logo_svg(h_team_team_id)

    v_team_score = Map.get(game, "vTeam") |> Map.get("score")
    v_team_team_id = Map.get(game, "vTeam") |> Map.get("teamId")
    v_team_logo_svg = get_team_logo_svg(v_team_team_id)

    point_diff = get_point_diff(v_team_score, h_team_score)

    %TheGame.NBAGame{
      clock: Map.get(game, "clock"),
      current_period: Map.get(game, "period") |> Map.get("current"),
      h_team_logo_svg: h_team_logo_svg,
      h_team_score: h_team_score,
      h_team_tricode: Map.get(game, "hTeam") |> Map.get("triCode"),
      point_diff: point_diff,
      v_team_logo_svg: v_team_logo_svg,
      v_team_score: v_team_score,
      v_team_tricode: Map.get(game, "vTeam") |> Map.get("triCode")
    }
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
