defmodule TheGameWeb.StandingsComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <div class="standings">
      <div class="east">
        <p class="font-lg">East</p>
        <%= for team <- @standings.east do %>
          <%= live_component(@socket, TheGameWeb.StandingTileComponent, team: team) %>
        <% end %>
      </div>
      <div class="west">
        <p class="font-lg">West</p>
        <%= for team <- @standings.west do %>
          <%= live_component(@socket, TheGameWeb.StandingTileComponent, team: team) %>
        <% end %>
      </div>
    </div>
    """
  end
end
