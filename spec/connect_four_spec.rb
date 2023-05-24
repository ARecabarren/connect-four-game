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
end