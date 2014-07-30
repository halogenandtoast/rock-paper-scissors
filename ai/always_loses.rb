module AI
  class AlwaysLoses
    def initialize(moves)
      @moves = moves
    end

    def respond_to(player_move)
      losing_move(player_move).label
    end

    private

    def losing_move(player_move)
      name = losing_move_name(player_move)
      @moves.find { |move| move.name == name }
    end

    def losing_move_name(player_move)
      player_move.outcomes.key("win")
    end
  end
end
