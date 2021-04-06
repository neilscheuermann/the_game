defmodule TheGame.NBA do
  @moduledoc """
  TheGame.NBA keeps the context that finds and reports live games
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

    {:ok, todays_games} = NBADataService.fetch_daily_games(todays_date)

    format_games(todays_games)
  end

  defp format_games(games) do
    Enum.map(games, &NBAGame.format_game/1)
  end
end
