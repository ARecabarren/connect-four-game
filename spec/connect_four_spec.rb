require_relative '../lib/board'

describe Board do
    describe '#initialize' do
        it "creates a 6x7 board with empty cells" do
            board = Board.new
            expect(board.cells).to eql([
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','','']
            ])
        end
    end
    describe '#make_move' do
        context 'with a valid move' do
          it 'places the player\'s piece in the specified column' do
            board = Board.new
            board.make_move(1, 'X') # Player 1 makes a move in column 1
            expect(board.cells).to eql([
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['','','','','','',''],
                ['X','','','','','','']
            ])
            end
        end

        context 'with an invalid move' do
            it 'does not place the player\'s piece if the column is full' do
                board = Board.new
                6.times{board.make_move(1, 'X')}
                expect(board.cells).to eql([
                    ['X','','','','','',''],
                    ['X','','','','','',''],
                    ['X','','','','','',''],
                    ['X','','','','','',''],
                    ['X','','','','','',''],
                    ['X','','','','','','']
                ])
            end
            it 'does not place the player\'s piece if the index is invalid' do
                board = Board.new
                board.make_move(0, 'X')
                expect(board.cells).to eql([
                    ['','','','','','',''],
                    ['','','','','','',''],
                    ['','','','','','',''],
                    ['','','','','','',''],
                    ['','','','','','',''],
                    ['','','','','','','']
                ])
            end
        end
    end
    describe '#play_game' do
        before do
            allow_any_instance_of(Board).to receive(:ask_player_for_move).and_return(1)
        end

        context 'when the game ends with a winner' do
            it 'displays the final board and the winner' do
              board = Board.new
              allow(board).to receive(:game_over?).and_return(true)
              allow(board).to receive(:display_board) # Stub the display_board method
              
              expect(board).to receive(:display_board).at_least(:twice)
              expect(board).to receive(:puts).with("Game Over!")
        
              board.play_game
            end
        end

        context 'when the game ends in a draw' do
            it 'displays the final board and a draw message' do
              board = Board.new
              allow(board).to receive(:game_over?).and_return(true)
              allow(board).to receive(:display_board) # Stub the display_board method
        
              expect(board).to receive(:display_board).at_least(:once)
              expect(board).to receive(:puts).with("Game Over!")
        
              board.play_game
            end
        end
    end
    describe '#game_over?' do
        context 'when there is a winning combination' do
            it 'returns true' do
              board = Board.new
              allow(board).to receive(:check_winner).and_return(true)
        
              expect(board.game_over?).to be true
            end
        end
        context 'when there is no winning combination' do
            it 'returns false' do
              board = Board.new
              allow(board).to receive(:check_winner).and_return(false)
        
              expect(board.game_over?).to be false
            end
        end
    end
end