class MainController < ApplicationController
    def index
        @teams = $spreadsheet.get_team_ids.map { |id| $spreadsheet.get_team_info(id) }
    end
end
