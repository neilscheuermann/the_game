defmodule TheGame.NBAGame do
  @moduledoc """
  Sets the NBAGame struct
  """
  defstruct [
    :clock,
    :excitement_level,
    :h_team_conf,
    :h_team_conf_rank,
    :h_team_logo_svg,
    :h_team_loss,
    :h_team_nickname,
    :h_team_streak_text,
    :h_team_score,
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
    :v_team_logo_svg,
    :v_team_loss,
    :v_team_nickname,
    :v_team_streak_text,
    :v_team_score,
    :v_team_url_city_and_name,
    :v_team_win
  ]

  def format_game(game, league_teams_data, league_standings_data) do
    h_team_score = Map.get(game, "hTeam") |> Map.get("score")
    h_team_id = Map.get(game, "hTeam") |> Map.get("teamId")
    h_team_logo_svg = get_team_logo_svg(h_team_id)

    h_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == h_team_id end)

    h_team_standings_meta =
      Enum.find(league_standings_data, fn %{"teamId" => team_id} -> team_id == h_team_id end)

    h_team_conf =
      h_team_meta
      |> Map.get("confName")

    h_team_conf_rank =
      h_team_standings_meta
      |> Map.get("confRank")
      |> nthify()

    h_team_nickname =
      h_team_meta
      |> Map.get("nickname")

    h_team_streak_text =
      h_team_standings_meta
      |> Map.get("teamSitesOnly")
      |> Map.get("streakText")

    h_team_url_city_and_name =
      h_team_meta
      |> Map.get("fullName")
      |> lower_dash()
      |> validate_url_city_and_name()

    v_team_score = Map.get(game, "vTeam") |> Map.get("score")
    v_team_id = Map.get(game, "vTeam") |> Map.get("teamId")
    v_team_logo_svg = get_team_logo_svg(v_team_id)

    v_team_meta =
      Enum.find(league_teams_data, fn %{"teamId" => team_id} -> team_id == v_team_id end)

    v_team_standings_meta =
      Enum.find(league_standings_data, fn %{"teamId" => team_id} -> team_id == v_team_id end)

    v_team_conf =
      v_team_meta
      |> Map.get("confName")

    v_team_conf_rank =
      v_team_standings_meta
      |> Map.get("confRank")
      |> nthify()

    v_team_nickname =
      v_team_meta
      |> Map.get("nickname")

    v_team_streak_text =
      v_team_standings_meta
      |> Map.get("teamSitesOnly")
      |> Map.get("streakText")

    v_team_url_city_and_name =
      v_team_meta
      |> Map.get("fullName")
      |> lower_dash()
      |> validate_url_city_and_name()

    period =
      game
      |> Map.get("period")
      |> Map.get("current")
      |> Integer.to_string()
      |> nthify()
      |> is_overtime?()

    point_diff = get_point_diff(v_team_score, h_team_score)

    excitement_level = determine_excitement_level(game, point_diff)

    national_broadcaster =
      game
      |> Map.get("watch")
      |> Map.get("broadcast")
      |> Map.get("broadcasters")
      |> Map.get("national")
      |> List.first()

    national_broadcaster =
      if national_broadcaster do
        Map.get(national_broadcaster, "longName")
      end

    %TheGame.NBAGame{
      clock: should_be_nil?(Map.get(game, "clock")),
      excitement_level: excitement_level,
      h_team_conf: h_team_conf,
      h_team_conf_rank: h_team_conf_rank,
      h_team_logo_svg: h_team_logo_svg,
      h_team_loss: Map.get(game, "hTeam") |> Map.get("loss"),
      h_team_nickname: h_team_nickname,
      h_team_streak_text: h_team_streak_text,
      h_team_score: h_team_score,
      h_team_url_city_and_name: h_team_url_city_and_name,
      h_team_win: Map.get(game, "hTeam") |> Map.get("win"),
      is_end_of_period: Map.get(game, "period") |> Map.get("isEndOfPeriod"),
      is_halftime: Map.get(game, "period") |> Map.get("isHalftime"),
      national_broadcaster: national_broadcaster,
      period: period,
      point_diff: point_diff,
      start_time_eastern: Map.get(game, "startTimeEastern"),
      start_date_eastern: Map.get(game, "startDateEastern"),
      v_team_conf: v_team_conf,
      v_team_conf_rank: v_team_conf_rank,
      v_team_logo_svg: v_team_logo_svg,
      v_team_loss: Map.get(game, "vTeam") |> Map.get("loss"),
      v_team_nickname: v_team_nickname,
      v_team_streak_text: v_team_streak_text,
      v_team_score: v_team_score,
      v_team_url_city_and_name: v_team_url_city_and_name,
      v_team_win: Map.get(game, "vTeam") |> Map.get("win")
    }
  end

  def get_team_logo_svg(team_id) do
    "https://cdn.nba.com/logos/nba/#{team_id}/primary/L/logo.svg"
  end

  defp determine_excitement_level(game, point_diff) do
    if game_is_completed(game, point_diff) do
      excitement_level_face(Map.get(game, "period"), point_diff)
    else
      nil
    end
  end

  defp determine_excitement_level(_) do
    nil
  end

  defp excitement_level_face(%{"current" => current}, _point_diff) when current > 4, do: "🤯🤯🤯"
  defp excitement_level_face(_period, point_diff) when point_diff < 5, do: "🤯🤯🤯"

  defp excitement_level_face(_period, point_diff) when point_diff >= 5 and point_diff < 10,
    do: "😲😲"

  defp excitement_level_face(_period, point_diff) when point_diff >= 10, do: "🥱"

  # statusNum that signifies a completed game
  defp game_is_completed(game = %{"statusNum" => 3}, _point_diff) do
    true
  end

  # In case where game is over but "statusNum" hasn't been updated yet.
  defp game_is_completed(
         game = %{"period" => %{"current" => 4, "isEndOfPeriod" => true}},
         point_diff
       )
       when point_diff != 0 do
    true
  end

  defp game_is_completed(_, _) do
    false
  end

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
