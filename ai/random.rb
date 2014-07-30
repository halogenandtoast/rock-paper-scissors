module AI
  class Random
    def initialize(moves)
      @moves = moves
    end

    def respond_to(player_move)
      @moves.sample.label
    end
  end
end
