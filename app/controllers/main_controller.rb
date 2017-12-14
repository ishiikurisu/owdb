class MainController < ApplicationController
    def index
        @teams = $spreadsheet.get_team_ids.map { |id| $spreadsheet.get_team_info(id) }
    end

    def get_team_info
        team_id = request['id']
        team_info = $spreadsheet.get_team_info team_id.to_i

        render inline: <<-END
        <div class="email-content-header pure-g">
            <div class="pure-u-1-2">
                <h1 class="email-content-title">#{team_info['nome']}</h1>
            </div>
            <div class="email-content-controls pure-u-1-2">
                <button class="secondary-button pure-button">Watch</button>
            </div>
        </div>

        <div class="email-content-body">
            <p>
                TODO Add players info here.
            </p>
        </div>
        END
    end
end
