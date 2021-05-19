defmodule TheGameWeb.StandingTileComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    game_status = Map.get(assigns.team.associated_game, :game_status, nil)

    ~L"""
      <div class="standing-tile">
        <p class="font-small"><%= @team.conf_rank %></p>
        <svg width="20" height="20">       
          <image xlink:href="<%= @team.logo_svg %>" width="20" height="20"/>    
        </svg>   
        <p class="font-med"><%= @team.tri_code %></p>
        <p class="font-small gray"><%= @team.clinched_playoffs_code %></p>

        <%= if game_status == :completed do %>
        <div class="standing-live-game-info font-small gray">
          <p>Completed</p>
        </div>
        <% end %>

        <%= if game_status == :live do %>
        <div class="standing-live-game-info font-small">
          <p class="standing-amp">
          <%= if @team.game_is_away do %>@ <% else %>vs <% end %>
          </p>
          <p><%= @team.opponent_tri_code %></p>
          <p>|</p>
          <p>±<%= @team.associated_game.point_diff %></p>
          <p>|</p>

          <%= if @team.associated_game.is_end_of_period and !@team.associated_game.is_halftime do %>
          <p>End of</p>
          <% end %>
          <%= if @team.associated_game.clock do %>
          <p><%= @team.associated_game.clock %></p>
          <p>-</p>
          <% end %>
          <%= if @team.associated_game.is_halftime do %>
          <p>Halftime</p>
          <% else %>
          <p><%= @team.associated_game.period %></p>
          <% end %>

        </div>
        <% end %>

        <%= if game_status == :upcoming do %>
        <div class="standing-live-game-info font-small gray">
          <p class="standing-amp">
          <%= if @team.game_is_away do %>@ <% else %>vs <% end %>
          </p>
          <p><%= @team.opponent_tri_code %></p>
          <p><%= @team.associated_game.start_time_eastern %></p>
          <%= if @team.associated_game.national_broadcaster do %>
          <p><%= @team.associated_game.national_broadcaster %></p>
          <% end %>
        </div>
        <% end %>

        <div class="standing-data font-med-small">
          <p><%= @team.win %>-<%= @team.loss %></p>
          <p><%= @team.games_behind %></p>
          <p><%= @team.streak %></p>
          <p><%= @team.last_ten_win %>-<%= @team.last_ten_loss %></p>
        </div>
      </div>
    """
  end
end
