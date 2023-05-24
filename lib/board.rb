class Board
    attr_reader :cells
    def initialize
        @cells = Array.new(6) {Array.new(7) {''} }
    end

    def make_move(column, player_piece)
        column -= 1 if column.is_a?(Numeric)
        return unless valid_column?(column)

        row = find_available_row(column)
        return unless row

        @cells[row][column] = player_piece
    end

    def valid_column?(column)
        column.is_a?(String) ? false : column.between?(0,7)
    end

    def find_available_row(column)
        (0..5).reverse_each do |row|
            return row if @cells[row][column].empty?
        end
        nil
    end



end