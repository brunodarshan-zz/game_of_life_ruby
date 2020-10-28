class GameOfLife
    attr_reader :cells
    def initialize(arr)
        @cells = ValidateInputCell.call(arr)
    end

    def next
        @cells = compute_next_generation
    end
    
    def count_neighbors_alive(line, column)
        neighbors_alive = @cells[line]
        neighbors_alive.delete_at(column) # only_neighbors in value line
    
        column_range = -> do
            if column == 0
                return column + (cells.size - 1)
            elsif column == (cells.size-1)
                return ((cells.size - 1) - column) .. column
            end
            (column - 1)..(column + 1)
        end.call
    
        if(line > 0) # count neighbors on top
            neighbors_alive << cells[line-1][column_range]
        end
    
        if (line < cells.size) && !cells[line+1].nil? # count neighbors below
            neighbors_alive << cells[line+1][column_range]
        end
        neighbors_alive.flatten.reduce(:+)
    end
    
    ValidateInputCell = -> (arr) do
        arr.map do |arr_child|
            raise 'invalid input array' unless arr_child.length == arr.size
            arr_child
        end
    end

    def compute_next_generation
        computed_generation = Array.new(@cells.size, Array.new(@cells.size))
        @cells.size do |line|
            (0..@cells.size).to_a do |col|
                neighbors = count_neighbors_alive(line, col)
                computed_generation[line, col] = (neighbors < 2 || neighbors > 3) ? 0 : 1
            end
        end
        computed_generation
    end
end
