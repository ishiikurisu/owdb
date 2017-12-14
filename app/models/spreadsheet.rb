require 'google_drive'

class Spreadsheet
    attr_reader :teamsheet
    attr_reader :playersheet

    def initialize key
        session = GoogleDrive::Session.from_service_account_key(key)
        spreadsheet = session.spreadsheet_by_title("OWDB")
        @teamsheet = spreadsheet.worksheets[0].rows
        @playersheet = spreadsheet.worksheets[1].rows
    end

    def get_team_ids
        @teamsheet[1..-1].map { |e| e[0].to_i }
    end

    def get_players_from_team_id id
        team_id_field = @playersheet[0].index 'time_id'
        @playersheet[1..-1].select { |player| player[team_id_field] == id }
    end

    def get_team_name_by_id id
        @teamsheet[id][1]
    end

    def get_team_info id
        info = { }
        available = @teamsheet[0]

        @teamsheet[id].each_with_index do |it, i|
            info[available[i]] = it
        end

        return info
    end
end
