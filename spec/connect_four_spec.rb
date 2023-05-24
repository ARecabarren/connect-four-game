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
end