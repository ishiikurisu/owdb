require "minitest/autorun"
require_relative "../../app/models/spreadsheet"

class TestSpreadsheet < MiniTest::Test
    def setup
        @spreadsheet = Spreadsheet.new './config/secrets.json'
    end

    def test_start_session_on_google_drive
        assert_equal 'id', @spreadsheet.teamsheet[0][0]
        assert_equal 'id', @spreadsheet.playersheet[0][0]
    end

    def test_can_organize_players_on_teams
        team_ids = @spreadsheet.get_team_ids
        players = @spreadsheet.get_players_from_team_id team_ids[0]
        assert_equal 3, players.length
    end
end
