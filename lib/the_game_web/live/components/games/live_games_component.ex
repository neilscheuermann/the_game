defmodule TheGameWeb.LiveGamesComponent do
  use Phoenix.LiveComponent

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    live_games = Enum.filter(assigns.days_games, fn x -> x.game_status == :live end)

    ~L"""
    <%# Live games %>
    <%= for game <- live_games do %>
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
          <div>
            <div class="amp">@</div>
            <a class="font-small" href="https://www.streameast.live/nba/<%= game.h_team_url_city_and_name %>-<%= game.v_team_url_city_and_name %>/" target="_blank">
              watch
            </a>
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
        <div class="game-info">

          <div class="time-period-point-diff">
            <div class="time-period">
              <%= if game.is_end_of_period and !game.is_halftime do %>
              <p>End of</p>
              <% end %>

              <%= if game.clock do %>
              <p><%= game.clock %></p>
              <% end %>

              <%= if game.is_halftime do %>
              <p>Halftime</p>
              <% else %>
              <p><%= game.period %></p>
              <% end %>
            </div>


            <%= if @show_score do %>
              <div class="visible-score bold-light" phx-click="toggle_score" phx-value-show_score="<%= @show_score %>">
                <p> <%= game.v_team_score %> </p>
                <p> <%= game.h_team_score %> </p>
              </div>
            <% else %>
              <div class="point-differential" phx-click="toggle_score" phx-value-show_score="<%= @show_score %>">
                <p class="bold-light">± <%= game.point_diff %></p>
                <p class="font-small">(point diff)</p>
              </div>
            <% end %>

          </div>
        </div>
      </div>
    <% end %>
    """
  end
end
