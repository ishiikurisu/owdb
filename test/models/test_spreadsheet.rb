require "minitest/autorun"
require_relative "../../app/models/spreadsheet"

class TestSpreadsheet < MiniTest::Test
    def setup
        @spreadsheet = Spreadsheet.new './config/secrets.json'
    end

    def test_start_session_on_google_drive
        assert_equal false, true
        assert_equal 'id', @spreadsheet.teamsheet.rows[0][0]
        assert_equal 'id', @spreadsheet.playersheet.rows[0][0]
    end
end
