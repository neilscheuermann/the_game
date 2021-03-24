defmodule TheGameWeb.TheGameLive do
  use TheGameWeb, :live_view

  def mount(_params, _session, socket) do
    TheGame.NBA.subscribe()

    if connected?(socket) do
      # conditionally perform stateful work, such as 
      # subscribing to pubsub topics, sending messages, etc.
      TheGame.NBA.subscribe()
    end

    live_games = TheGame.NBA.find_live_close_games()

    {:ok, assign(socket, live_games: live_games)}
    # {:ok, assign(socket, live_games: live_games_intial_state)}
  end

  def handle_info({:fifteen_second_update, live_games}, socket) do
    {:noreply, assign(socket, live_games: live_games)}
  end

  def handle_info(_event, socket) do
    IO.inspect("In handle_info catch all>>>")
    {:noreply, socket}
  end
end
