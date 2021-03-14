defmodule TheGameWeb.TheGameLive do
  use TheGameWeb, :live_view

  def mount(_params, _session, socket) do
    TheGame.NBA.subscribe()

    if connected?(socket) do
      # conditionally perform stateful work, such as 
      # subscribing to pubsub topics, sending messages, etc.
      TheGame.NBA.subscribe()
    end

    # live_games = TheGame.NBA.find_live_close_games()
    live_games_intial_state = [
      %{
        clock: "02:40",
        h_team: %{score: 108, tricode: "POR"},
        period: "4",
        point_diff: 13,
        v_team: %{score: 121, tricode: "PHX"}
      },
      %{
        clock: "07:38",
        h_team: %{score: 108, tricode: "SAC"},
        period: "4",
        point_diff: 17,
        v_team: %{score: 91, tricode: "HOU"}
      }
    ]

    {:ok, assign(socket, live_games: live_games_intial_state)}
  end

  def handle_info({:fifteen_second_update, live_games}, socket) do
    IO.inspect(live_games, label: "live_games>>>")
    IO.inspect(socket, label: "socket>>>")
    {:noreply, assign(socket, live_games: live_games)}
  end

  def handle_info(_event, socket) do
    IO.inspect("In handle_info catch all>>>")
    {:noreply, socket}
  end
end
