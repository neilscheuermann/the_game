defmodule TheGameWeb.TheGameLive do
  use TheGameWeb, :live_view

  def render(assigns) do
    ~L"""
    <div class="container">
      <h2 class="heading">Today's Games</h2>
      <%= live_component(@socket, TheGameWeb.LiveGamesComponent, days_games: @days_games, show_excitement_level: @show_excitement_level) %>
      <%= live_component(@socket, TheGameWeb.CompletedGamesComponent, days_games: @days_games, show_excitement_level: @show_excitement_level) %>
      <%= live_component(@socket, TheGameWeb.UpcomingGamesComponent, days_games: @days_games, show_excitement_level: @show_excitement_level) %>
      <br>

      <h3 class="heading">Standings</h3>
      <%= live_component(@socket, TheGameWeb.StandingsComponent, standings: @standings) %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket) do
      # conditionally perform stateful work, such as 
      # subscribing to pubsub topics, sending messages, etc.
      TheGame.NBA.subscribe()
    end

    days_games = TheGame.NBA.get_days_games()

    standings = TheGame.NBA.conference_standings()

    show_excitement_level = false

    {:ok,
     assign(socket,
       days_games: days_games,
       standings: standings,
       show_excitement_level: show_excitement_level
     )}
  end

  def handle_event(
        "toggle_excitement_level",
        %{"show_excitement_level" => show_excitement_level},
        socket
      ) do
    {:reply, %{},
     assign(socket,
       show_excitement_level: !TheGame.Converter.convert!(show_excitement_level)
     )}
  end

  def handle_info({:fifteen_second_update, days_games}, socket) do
    {:noreply, assign(socket, days_games: days_games)}
  end

  def handle_info(_event, socket) do
    IO.inspect("In handle_info catch all")
    {:noreply, socket}
  end
end
