require "./chess_consts"

class Board
    attr_reader :pieces

    def initialize
        @pieces = {}
    end
end
