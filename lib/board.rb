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

    def ask_player_for_move
        puts "#{@current_player}, enter the column number (1-7): "
        gets.chomp.to_i
    end

    def display_board
        @cells.each do |row|
            puts row.join(' ')
        end
    end

    # def switch_player
    #     @current_player = @players.find{|player| != @current_player}
    # end

    def game_over?
        
    end

    def check_winner
        # Horizontal check
        @cells.each do |row|
            return true if row.join('').include?(@current_player * 4)
        end

        # Vertical check
        columns = @cells.transpose
        columns.each do |column|
            return true if column.join('').include?(@current_player * 4)
        end

        # Diagonals left to right
        (0..2).each do |row|
            (0..3).each do |column|
                return true if [@cells[row][column], @cells[row + 1][column + 1], @cells[row + 2][column + 2], @cells[row + 3][column + 3]].join('').include?(@current_player * 4)
            end
        end

        # Diagonals left to right
        (0..2).each do |row|
            (3..6).each do |column|
                return true if [@cells[row][column], @cells[row + 1][column - 1], @cells[row + 2][column - 2], @cells[row + 3][column - 3]].join('').include?(@current_player * 4)
            end
        end

        false
    end
end