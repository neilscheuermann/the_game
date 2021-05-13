defmodule TheGameWeb.StandingTileComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
      <div class="standing-tile">
        <p><%= @team.conf_rank %></p>
        <svg width="20" height="20">       
          <image xlink:href="<%= @team.logo_svg %>" width="20" height="20"/>    
        </svg>   
        <p><%= @team.tri_code %></p>
        <p class="font-small"><%= @team.clinched_playoffs_code %></p>

        <%= if @team.game_is_underway do %>
        <div class="standing-live-game-info">
          <p class="standing-amp">
            <%= if @team.game_is_away do%>@<% else %>vs.<% end %>  
          </p>
          <p><%= @team.opponent_tri_code %></p>
          <p>|</p>
          <p>± <%= @team.point_diff %></p>
          <p>|</p>
          <p><%= @team.clock %></p>
          <p><%= @team.period %></p>
        </div>
        <% end %>

        <div class="standing-data font-med">
          <p><%= @team.win %>-<%= @team.loss %></p>
          <p><%= @team.games_behind %></p>
          <p><%= @team.streak %></p>
          <p><%= @team.last_ten_win %>-<%= @team.last_ten_loss %></p>
        </div>
      </div>
    """
  end
end
