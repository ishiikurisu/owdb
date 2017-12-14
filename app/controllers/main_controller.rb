class MainController < ApplicationController
    def index
        @teams = $spreadsheet.get_team_ids.map { |id| $spreadsheet.get_team_info(id) }
    end

    def get_team_info
        # TODO Move all this HTML to an actual HTML file
        team_id = request['id'].to_i
        team_info = $spreadsheet.get_team_info team_id
        players = $spreadsheet.get_players_from_team_id(team_id).map{ |id| $spreadsheet.get_player_info id }
        players_info = <<-END
            <div class="pure-u">
                <p>Nenhum jogador registrado!</p>
            </div>
        END

        if players.length > 0
            players_info = players.inject('') do |box, player|
                box + <<-END
                    <div class="pure-u">
                        <h1>#{player['nome']} (#{player['nick']})</h1>
                        <ul>
                            <li>Esteve na copa do mundo? Não</li>
                        </ul>
                    </div>
                END
            end
        end

        render inline: <<-END
        <div class="email-content-header pure-g">
            <div class="pure-u-1-2">
                <h1 class="email-content-title">#{team_info['nome']}</h1>
            </div>
            <div class="email-content-controls pure-u-1-2">
                <button class="secondary-button pure-button">Watch</button>
            </div>
        </div>

        <div class="email-content-body pure-g">
            #{players_info}
        </div>
        END
    end
end
