defmodule TheGame.NBAStandingTile do
  @moduledoc """
  Sets the NBAStandingTile struct
  """
  defstruct [
    :associated_game,
    :clinched_playoffs_code,
    :clock,
    :conf_rank,
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

  def format_standings(standings, days_games) do
    east_standings =
      standings
      |> Map.get("east")
      |> Enum.map(fn standing -> format_standing_tile(standing, days_games) end)

    west_standings =
      standings
      |> Map.get("west")
      |> Enum.map(fn standing -> format_standing_tile(standing, days_games) end)

    %{east: east_standings, west: west_standings}
  end

  defp format_standing_tile(team_standing_string_map, days_games) do
    team_standing =
      team_standing_string_map
      |> convert_to_atom_map()
      |> enrinch_with_game_data(days_games)

    %TheGame.NBAStandingTile{}
    |> Map.put(:associated_game, team_standing.associated_game)
    |> Map.put(:conf_rank, team_standing.confRank)
    |> Map.put(:clinched_playoffs_code, team_standing.clinchedPlayoffsCode)
    |> Map.put(:games_behind, team_standing.gamesBehind)
    |> Map.put(:last_ten_loss, team_standing.lastTenLoss)
    |> Map.put(:last_ten_win, team_standing.lastTenWin)
    |> Map.put(:win, team_standing.win)
    |> Map.put(:loss, team_standing.loss)
    |> Map.put(:streak, Map.get(team_standing.teamSitesOnly, "streakText"))
    |> Map.put(:logo_svg, TheGame.NBAGame.get_team_logo_svg(team_standing.teamId))
    |> Map.put(
      :opponent_tri_code,
      get_opponent_tricode(team_standing.teamId, team_standing.associated_game)
    )
    |> Map.put(:tri_code, Map.get(team_standing.teamSitesOnly, "teamTricode"))
    |> Map.put(
      :game_is_away,
      determine_if_game_is_away(team_standing.teamId, team_standing.associated_game)
    )
  end

  defp determine_if_game_is_away(team_id, %{v_team_id: v_team_id}) when team_id == v_team_id,
    do: true

  defp determine_if_game_is_away(team_id, %{v_team_id: v_team_id}) when team_id == v_team_id,
    do: false

  defp determine_if_game_is_away(_team_id, _associated_game), do: false

  defp enrinch_with_game_data(team_standing, days_games) do
    team_id = team_standing.teamId

    associated_game =
      Enum.find(days_games, fn game ->
        game.v_team_id == team_id || game.h_team_id == team_id
      end)

    if associated_game do
      Map.put(team_standing, :associated_game, associated_game)
    else
      Map.put(team_standing, :associated_game, %{})
    end
  end

  defp get_opponent_tricode(team_id, %{v_team_id: v_team_id, h_team_tri_code: h_team_tri_code})
       when team_id == v_team_id do
    h_team_tri_code
  end

  defp get_opponent_tricode(team_id, %{h_team_id: h_team_id, v_team_tri_code: v_team_tri_code})
       when team_id == h_team_id do
    v_team_tri_code
  end

  defp get_opponent_tricode(team_id, associated_game) do
    nil
  end

  defp convert_to_atom_map(string_map) do
    for {key, val} <- string_map, into: %{}, do: {String.to_atom(key), val}
  end
end
