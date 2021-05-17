defmodule TheGameWeb.UpcomingGamesComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    upcoming_games = Enum.filter(assigns.days_games, fn x -> x.game_status == :upcoming end)

    ~L"""
    <%# Upcoming games %>
    <%= for game <- upcoming_games do %>
      <div class="nba-game-tile">
        <div class="team-info">
          <div>
            <svg width="40" height="40">       
              <image xlink:href="<%= game.v_team_logo_svg %>" width="40" height="40"/>    
            </svg>   
            <div class="team-name-rank-wrapper">
              <p>
                <%= game.v_team_nickname %>
              </p>
              <div class="team-rank-wrapper">
                <p>
                  <%= game.v_team_win %>-<%= game.v_team_loss %>
                </p>
                <p>|</p>
                <p>
                  <%= game.v_team_streak_text %>
                </p>
                <p>|</p>
                <p>
                  <%= game.v_team_conf_rank %> in the <%= game.v_team_conf %>
                </p>
              </div>
            </div>
          </div>
          <div class="amp">
            @
          </div>
          <div>
            <svg width="40" height="40">       
              <image xlink:href="<%= game.h_team_logo_svg %>" width="40" height="40"/>    
            </svg>   
            <div class="team-name-rank-wrapper">
              <p>
                <%= game.h_team_nickname %>
              </p>
              <div class="team-rank-wrapper">
                <p>
                  <%= game.h_team_win %>-<%= game.h_team_loss %>
                </p>
                <p>|</p>
                <p>
                  <%= game.h_team_streak_text %>
                </p>
                <p>|</p>
                <p>
                  <%= game.h_team_conf_rank %> in the <%= game.h_team_conf %>
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="upcoming-game-info">
          <p class="font-med">
            <%= game.start_time_eastern %> 
          </p>
          <%= if game.national_broadcaster do %>
          <p class="font-small"><%= game.national_broadcaster %></p>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end
end
