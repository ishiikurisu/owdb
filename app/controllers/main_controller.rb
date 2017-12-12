class MainController < ApplicationController
    def index
        @names = $spreadsheet.get_team_ids.map { |id| $spreadsheet.get_team_name_by_id(id) }
    end
end
