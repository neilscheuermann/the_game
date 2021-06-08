defmodule TheGame.Notifications do
  @moduledoc """
  TheGame.Notifications is the context for managing and sending notifications
  """

  require Logger

  @four_minutes_in_seconds 240

  def send_live_game_notifications(live_games, :nba) do
    close_games = Enum.filter(live_games, &is_close_game?/1)

    Enum.each(close_games, &send_needed_notifications/1)
  end

  # Nailbiter criteria.
  # Checks that the game is live, in the 4th, and < 8 point difference
  defp is_close_game?(%{
         game_status: :live,
         period: "4th",
         point_diff: point_diff,
         period_seconds_remaining: period_seconds_remaining
       })
       when point_diff < 8 and
              period_seconds_remaining < @four_minutes_in_seconds do
    true
  end

  defp is_close_game?(_game) do
    false
  end

  defp send_needed_notifications(%{
         game_id: game_id,
         h_team_nickname: h_team_nickname,
         live_streameast_link: live_streameast_link,
         v_team_nickname: v_team_nickname
       }) do
    if not sent_current_close_game_noti?(game_id) do
      text_body =
        "Close game! #{h_team_nickname} vs #{v_team_nickname} \n\n #{live_streameast_link}"

      my_number = System.get_env("PERSONAL_NUMBER")

      TheGame.TwilioApi.send_sms(text_body, my_number)

      Logger.info("Sent notification with following text body:>>> #{inspect(text_body)}")
      Cachex.put(:game_notifications_cache, game_id, true)
    end
  end

  defp sent_current_close_game_noti?(game_id) do
    case Cachex.get(:game_notifications_cache, game_id) do
      {:ok, true} ->
        true

      {:ok, _} ->
        false

      # If there's an error, pretend we sent a noti so we don't send a duplicate
      {:error, error} ->
        Logger.warn("Error with Cachex. error: #{error}")
        true
    end
  end
end
