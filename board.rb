require "./chess_consts"
require "./piece"

class Board
    attr_reader :pieces

    def initialize
        @pieces = self.setup_pieces
    end

    def setup_pieces
        ret = []
        # Pawns
        ("a".."h").each do |col|
            ret << Piece.new(Chess::B_PAWN, 7, col)
            ret << Piece.new(Chess::W_PAWN, 2, col)
        end
        # Rooks
        ["a", "h"].each do |col|
            ret << Piece.new(Chess::B_ROOK, 8, col)
            ret << Piece.new(Chess::W_ROOK, 1, col)
        end
        # Knights
        ["b", "g"].each do |col|
            ret << Piece.new(Chess::B_KNIGHT, 8, col)
            ret << Piece.new(Chess::W_KNIGHT, 1, col)
        end
        # Rooks
        ["c", "f"].each do |col|
            ret << Piece.new(Chess::B_ROOK, 8, col)
            ret << Piece.new(Chess::W_ROOK, 1, col)
        end
        # King and Queen
        ret << Piece.new(Chess::B_KING, 8, "e")
        ret << Piece.new(Chess::W_KING, 1, "e")
        ret << Piece.new(Chess::B_QUEEN, 8, "d")
        ret << Piece.new(Chess::W_QUEEN, 1, "d")
        return ret
    end

    def get_white_pieces
        return @pieces.select{|p| p.is_white?}
    end    

    def get_black_pieces
        return @pieces.select{|p| p.is_black?}
    end

    def get_piece_at(row, col)
        @pieces.each do |piece|
            return piece if piece.row.eql? row and piece.col.eql? col
        end
        return nil
    end

    def to_s
        ret = ""
        ret << Chess::ASCII_ROW
        (1..8).each do |row|
            ("a".."h").each do |col|
                piece = get_piece_at(row, col)
                if not piece.nil? then ret << "|#{piece.type}"
                else ret << "| " end
            end
            ret << "|\n#{Chess::ASCII_ROW}"
        end
        return ret
    end
end
