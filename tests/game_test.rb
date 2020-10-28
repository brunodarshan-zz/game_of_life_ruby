require 'test/unit'
require_relative '../game_of_life'

class GameTest < Test::Unit::TestCase
    def test_initialize_on_success
        game = GameOfLife.new([[1, 0], [0, 0]])
        assert_equal game.class, GameOfLife, 'should returns a GameOfLive class'
    end

    def test_game_has_a_array_of_cells
        game = GameOfLife.new([[1, 0], [0, 0]])
        assert game.respond_to?(:cells).eql?(true)
        assert_equal game.cells, [[1, 0], [0, 0]]
    end

    def test_count_neighbors_alive
        expected_result = 5
        game = GameOfLife.new([[1, 1, 1], [1, 1, 0], [1, 0, 0]])
        assert_equal game.count_neighbors_alive(1, 1), expected_result
    end

    # def test_next_generation
    #     game = GameOfLife.new([[1, 1, 1], [1, 1, 0], [1, 0, 0]])
    #     first_generation = game.cells
    #     game.next
    #     assert_equal game.compute_next_generation, first_generation
    # end
end