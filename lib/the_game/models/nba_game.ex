defmodule TheGame.NBAGame do
  @moduledoc """
  Sets the NBAGame struct
  """
  defstruct [
    :clock,
    :excitement_level,
    # [:completed, :live, :upcoming]
    :game_status,
    :h_team_conf,
    :h_team_conf_rank,
    :h_team_id,
    :h_team_logo_svg,
    :h_team_loss,
    :h_team_nickname,
    :h_team_streak_text,
    :h_team_score,
    :h_team_tri_code,
    :h_team_url_city_and_name,
    :h_team_win,
    :is_end_of_period,
    :is_halftime,
    :national_broadcaster,
    :period,
    :point_diff,
    :start_time_eastern,
    :start_date_eastern,
    :v_team_conf,
    :v_team_conf_rank,
    :v_team_id,
    :v_team_logo_svg,
    :v_team_loss,
    :v_team_nickname,
    :v_team_streak_text,
    :v_team_score,
    :v_team_tri_code,
    :v_team_url_city_and_name,
    :v_team_win
  ]

  def format_game(game, league_teams_data, league_standings_data) do
    game = convert_to_atom_map(game)
    h_team_id = game.hTeam |> Map.get("teamId")
    v_team_id = game.vTeam |> Map.get("teamId")

    h_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == h_team_id end)
      |> convert_to_atom_map()

    h_team_standings_meta =
      Enum.find(league_standings_data, fn %{"teamId" => team_id} -> team_id == h_team_id end)
      |> convert_to_atom_map()

    v_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == v_team_id end)
      |> convert_to_atom_map()

    v_team_standings_meta =
      Enum.find(league_standings_data, fn %{"teamId" => team_id} -> team_id == v_team_id end)
      |> convert_to_atom_map()

    h_team_score = game.hTeam |> Map.get("score")
    v_team_score = game.vTeam |> Map.get("score")
    point_diff = get_point_diff(v_team_score, h_team_score)
    game_status = determine_game_status(game, point_diff)

    period =
      game.period
      |> Map.get("current")
      |> Integer.to_string()
      |> nthify()
      |> is_overtime?()

    national_broadcaster =
      game.watch
      |> Map.get("broadcast")
      |> Map.get("broadcasters")
      |> Map.get("national")
      |> List.first()

    national_broadcaster =
      if national_broadcaster do
        Map.get(national_broadcaster, "longName")
      end

    %TheGame.NBAGame{}
    |> Map.put(:clock, should_be_nil?(game.clock))
    |> Map.put(:excitement_level, determine_excitement_level(game_status, period, point_diff))
    |> Map.put(:game_status, game_status)
    |> Map.put(:h_team_conf, h_team_meta.confName)
    |> Map.put(:h_team_conf_rank, nthify(h_team_standings_meta.confRank))
    |> Map.put(:h_team_id, h_team_id)
    |> Map.put(:h_team_logo_svg, get_team_logo_svg(h_team_id))
    |> Map.put(:h_team_loss, Map.get(game.hTeam, "loss"))
    |> Map.put(:h_team_nickname, h_team_meta.nickname)
    |> Map.put(:h_team_streak_text, Map.get(h_team_standings_meta.teamSitesOnly, "streakText"))
    |> Map.put(:h_team_score, h_team_score)
    |> Map.put(:h_team_tri_code, Map.get(h_team_standings_meta.teamSitesOnly, "teamTricode"))
    |> Map.put(
      :h_team_url_city_and_name,
      h_team_meta.fullName
      |> lower_dash()
      |> validate_url_city_and_name()
    )
    |> Map.put(:h_team_win, Map.get(game.hTeam, "win"))
    |> Map.put(:is_end_of_period, Map.get(game.period, "isEndOfPeriod"))
    |> Map.put(:is_halftime, Map.get(game.period, "isHalftime"))
    |> Map.put(:national_broadcaster, national_broadcaster)
    |> Map.put(:period, period)
    |> Map.put(:point_diff, point_diff)
    |> Map.put(:start_time_eastern, game.startTimeEastern)
    |> Map.put(:start_date_eastern, game.startDateEastern)
    |> Map.put(:v_team_conf, v_team_meta.confName)
    |> Map.put(:v_team_conf_rank, nthify(v_team_standings_meta.confRank))
    |> Map.put(:v_team_id, v_team_id)
    |> Map.put(:v_team_logo_svg, get_team_logo_svg(v_team_id))
    |> Map.put(:v_team_loss, Map.get(game.vTeam, "loss"))
    |> Map.put(:v_team_nickname, v_team_meta.nickname)
    |> Map.put(:v_team_streak_text, Map.get(v_team_standings_meta.teamSitesOnly, "streakText"))
    |> Map.put(:v_team_score, v_team_score)
    |> Map.put(:v_team_tri_code, Map.get(v_team_standings_meta.teamSitesOnly, "teamTricode"))
    |> Map.put(
      :v_team_url_city_and_name,
      v_team_meta.fullName
      |> lower_dash()
      |> validate_url_city_and_name()
    )
    |> Map.put(:v_team_win, Map.get(game.vTeam, "win"))
  end

  defp convert_to_atom_map(string_map) do
    for {key, val} <- string_map, into: %{}, do: {String.to_atom(key), val}
  end

  def get_team_logo_svg(team_id) do
    "https://cdn.nba.com/logos/nba/#{team_id}/primary/L/logo.svg"
  end

  defp determine_excitement_level(:completed, period, point_diff) do
    excitement_level_face(period, point_diff)
  end

  defp determine_excitement_level(_game_status, _period, _point_diff) do
    nil
  end

  defp determine_game_status(%{statusNum: 1}, _point_dif), do: :upcoming
  defp determine_game_status(%{statusNum: 2}, _point_diff), do: :live

  defp determine_game_status(%{statusNum: 3}, _point_diff) do
    :completed
  end

  defp determine_game_status(
         %{period: %{"current" => 4, "isEndOfPeriod" => true}},
         point_diff
       )
       when point_diff != 0 do
    :completed
  end

  defp excitement_level_face(%{"current" => current}, _point_diff) when current > 4, do: "🤯🤯🤯"
  defp excitement_level_face(_period, point_diff) when point_diff < 5, do: "🤯🤯🤯"

  defp excitement_level_face(_period, point_diff) when point_diff >= 5 and point_diff < 10,
    do: "😲😲"

  defp excitement_level_face(_period, point_diff) when point_diff >= 10, do: "🥱"

  defp is_overtime?(period) do
    case period do
      "5th" -> "OT"
      "6th" -> "OT2"
      "7th" -> "OT3"
      "8th" -> "OT4"
      _ -> period
    end
  end

  defp should_be_nil?(""), do: nil

  defp should_be_nil?(val), do: val

  # only works up to 20
  def nthify(num) do
    case num do
      "1" -> num <> "st"
      "2" -> num <> "nd"
      "3" -> num <> "rd"
      _ -> num <> "th"
    end
  end

  defp get_point_diff(score_a, score_b) when score_a === "" or score_b === "" do
    nil
  end

  defp get_point_diff(score_a, score_b) do
    {score_a, _} = Integer.parse(score_a)
    {score_b, _} = Integer.parse(score_b)

    abs(score_a - score_b)
  end

  defp lower_dash(string) do
    string
    |> String.split(" ")
    |> Enum.join("-")
    |> String.downcase()
  end

  defp validate_url_city_and_name(city_and_name) do
    case city_and_name do
      "la-clippers" -> "los-angeles-clippers"
      _ -> city_and_name
    end
  end
end
