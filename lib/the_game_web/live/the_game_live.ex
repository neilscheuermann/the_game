defmodule TheGameWeb.TheGameLive do
  use TheGameWeb, :live_view

  def mount(_params, _session, socket) do
    # can maybe remove?
    TheGame.NBA.subscribe()

    if connected?(socket) do
      # conditionally perform stateful work, such as 
      # subscribing to pubsub topics, sending messages, etc.
      TheGame.NBA.subscribe()
    end

    days_games = TheGame.NBA.get_days_games()

    standings = TheGame.NBA.conference_standings()

    {:ok, assign(socket, days_games: days_games, standings: standings)}
  end

  def handle_info({:fifteen_second_update, days_games}, socket) do
    {:noreply, assign(socket, days_games: days_games)}
  end

  def handle_info(_event, socket) do
    IO.inspect("In handle_info catch all>>>")
    {:noreply, socket}
  end
end
