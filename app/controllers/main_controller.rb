class MainController < ApplicationController
    def index
        @name = $spreadsheet.name
    end
end
