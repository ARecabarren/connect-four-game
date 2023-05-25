class Board
    attr_reader :cells
    attr_accessor :cells
    def initialize
        @cells = Array.new(6) {Array.new(7) {''} }
        @players = ['X', 'O']
        @current_player = @players.sample
    end

    def play_game
        loop do
            display_board
            column = ask_player_for_move
            make_move(column, @current_player)
            
            if game_over?
                display_board
                puts "Game Over!"
                break
            end
      
            switch_player
        end
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

    def switch_player
        @current_player = @players.find { |player| player != @current_player }
    end

    def game_over?
        return true if check_winner || board_full?
        false
    end

    def board_full?
        return true if @cells.flatten.none?('')
        false
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