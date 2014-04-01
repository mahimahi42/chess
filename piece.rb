require "./chess_consts"

class Piece
    attr_reader :type
    attr_accessor :row, :col

    def initialize(type = Chess::W_KING, row = 1, col = "e")
        @type = type
        @row = row
        @col = col
    end

    def to_s
        "#{@type} - #{col}#{row}"
    end
end
