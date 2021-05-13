defmodule TheGame.NBAStandingTile do
  @moduledoc """
  Sets the NBAStandingTile struct
  """
  defstruct [
    :clinched_playoffs_code,
    :clock,
    :conf_rank,
    :game_is_underway,
    :game_is_away,
    :games_behind,
    :last_ten_loss,
    :last_ten_win,
    :logo_svg,
    :loss,
    :opponent_tri_code,
    :period,
    :point_diff,
    :streak,
    :tri_code,
    :win
  ]

  def format_standings(standings) do
    east_standings = Enum.map(Map.get(standings, "east"), &format_standing_tile/1)
    west_standings = Enum.map(Map.get(standings, "west"), &format_standing_tile/1)

    %{east: east_standings, west: west_standings}
  end

  defp format_standing_tile(team_standing_string_map) do
    team_standing =
      for {key, val} <- team_standing_string_map, into: %{}, do: {String.to_atom(key), val}

    %TheGame.NBAStandingTile{}
    |> Map.put(:conf_rank, team_standing.confRank)
    |> Map.put(:clinched_playoffs_code, team_standing.clinchedPlayoffsCode)
    |> Map.put(:games_behind, team_standing.gamesBehind)
    |> Map.put(:last_ten_loss, team_standing.lastTenLoss)
    |> Map.put(:last_ten_win, team_standing.lastTenWin)
    |> Map.put(:win, team_standing.win)
    |> Map.put(:loss, team_standing.loss)
    |> Map.put(:streak, Map.get(team_standing.teamSitesOnly, "streakText"))
    |> Map.put(:logo_svg, TheGame.NBAGame.get_team_logo_svg(team_standing.teamId))
    |> Map.put(:tri_code, Map.get(team_standing.teamSitesOnly, "teamTricode"))
    |> Map.put(:game_is_underway, false)
  end
end
