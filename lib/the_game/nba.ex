defmodule TheGame.NBA do
  @moduledoc """
  TheGame.NBA keeps the context that finds and reports live games
  """

  alias TheGame.{
    NBADataService,
    DateService
  }

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(TheGame.PubSub, @topic)
  end

  def broadcast_change(event, data) do
    Phoenix.PubSub.broadcast(TheGame.PubSub, @topic, {event, data})
  end

  def find_and_broadcast_games() do
    live_games = get_live_close_games()

    broadcast_change(:fifteen_second_update, live_games)
  end

  def get_live_close_games() do
    todays_date = DateService.get_current_date("America/Los_Angeles")

    {:ok, todays_games} = NBADataService.fetch_daily_games(todays_date)

    todays_games
    |> IO.inspect(label: "today's games>>>")
    |> Enum.filter(&is_live_game/1)
  end

  defp is_live_game(%{"isGameActivated" => true}), do: true

  defp is_live_game(_), do: false
end
