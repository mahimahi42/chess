require "./chess_consts"

class Piece
    attr_reader :color, :type 
    attr_accessor :row, :col
    
    def initialize(color = Chess::COL_WHITE, )
    
    end
end

#class Piece
#    attr_reader :type
#    attr_accessor :row, :col
#
#    def initialize(type = Chess::W_KING, row = 1, col = "e")
#        @type = type
#        @row = row
#        @col = col
#    end
#
#    def to_s
#        "#{@type} - #{col}#{row}"
#    end
#
#    def is_pawn?
#        if @type.eql? Chess::B_PAWN or @type.eql? Chess::W_PAWN then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_rook?
#        if @type.eql? Chess::B_ROOK or @type.eql? Chess::W_ROOK then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_knight?
#        if @type.eql? Chess::B_KNIGHT or @type.eql? Chess::W_KNIGHT then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_bishop?
#        if @type.eql? Chess::B_BISHOP or @type.eql? Chess::W_BISHOP then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_queen?
#        if @type.eql? Chess::B_QUEEN or @type.eql? Chess::W_QUEEN then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_king?
#        if @type.eql? Chess::B_KING or @type.eql? Chess::W_KING then
#            return true
#        else
#            return false
#        end
#    end
#
#    def is_white?
#        white_types = [
#            Chess::W_KING,
#            Chess::W_QUEEN,
#            Chess::W_ROOK,
#            Chess::W_BISHOP,
#            Chess::W_KNIGHT,
#            Chess::W_PAWN
#        ]
#        if white_types.include? @type then return true
#        else return false end
#    end
#
#    def is_black?
#        !is_white?
#    end
#end
