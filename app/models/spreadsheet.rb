require 'google_drive'

class Spreadsheet
    attr_reader :teamsheet
    attr_reader :playersheet

    def initialize key
        session = GoogleDrive::Session.from_service_account_key(key)
        @spreadsheet = session.spreadsheet_by_title("OWDB")
        @teamsheet = spreadsheet.worksheets.first
        @playersheet = spreadsheet.worksheets.second
    end
end
