require "./chess_consts"

class Piece
    attr_reader   :color, :type 
    attr_accessor :row,   :col
    
    def initialize()
        @color = nil
        @type  = nil
        @row   = nil
        @col   = nil
    end
    
    def move(new_row, new_col)
        raise "Override me!"
    end
end

class Pawn < Piece
    def initialize(color = Chess::COL_WHITE, row = 2, col = "a")
        @color = color
        @type  = Chess::PAWN
        @col   = col
        @fmove = true
        case @color
            when Chess::COL_WHITE then @row = 2
            when Chess::COL_BLACK then @row = 7
        end
    end
    
    def move(new_row = @row, new_col = @col)
        # First move moving two
        if new_row.eql? (@row + 2) and @fmove and new_col.eql? @col
            @row += 2
            @fmove = false
        # Moving one
        elsif new_row.eql? (@row + 1) and new_col.eql? @col
            @row += 1
            @fmove = false if @fmove
        # Capturing
        elsif new_row.eql? (@row + 1) and check_cols_for_capture(new_col)
            @row += 1
            @col = new_col
            @fmove = false if @fmove
        end
    end
    
    def check_cols_for_capture(new_col)
        col_bytes = @col.bytes[0]
        new_col_bytes = new_col.bytes[0]
        
        if new_col_bytes.eql? (col_bytes + 1) or new_col_bytes.eql? (col_bytes - 1) then
            return true
        end
        return false
    end
    
    def to_s
        if @color.eql? Chess::COL_WHITE
            return "#{Chess::W_PAWN} - #{row}#{col}"
        else
            return "#{Chess::B_PAWN} - #{row}#{col}"
        end
    end
end

p = Pawn.new(Chess::COL_BLACK)
puts p.to_s
p.col = "f"
puts p.to_s
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
