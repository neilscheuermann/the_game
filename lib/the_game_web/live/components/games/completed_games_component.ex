defmodule TheGameWeb.CompletedGamesComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    completed_games = Enum.filter(assigns.days_games, fn x -> x.game_status == :completed end)

    ~L"""
    <%# Completed games %>
    <%= for game <- completed_games do %>
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
                  <%= game.h_team_conf_rank %> in the <%= game.h_team_conf %>
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="game-info">
          <a class="font-small" href="https://www.youtube.com/results?search_query=<%= game.v_team_nickname %>+at+<%= game.h_team_nickname %>+<%= game.start_date_eastern %>" target="_blank">
            recap
          </a>
          <div>
            <div class="toggle-excitement-button" phx-click="toggle_excitement_level" phx-value-show_excitement_level="<%= @show_excitement_level %>">
              <%= if @show_excitement_level do %>
                <p><span><%= game.excitement_level%></span></p>
              <% else %>
                <p class="font-med">--</p>
              <% end %>
            </div>
            <p class="font-med">Final</p>
          </div>
        </div>
      </div>
    <% end %>
    """
  end
end
