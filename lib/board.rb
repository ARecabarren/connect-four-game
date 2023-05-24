class Board
    attr_reader :cells
    def initialize
        @cells = Array.new(6) {Array.new(7) {''} }
    end
end