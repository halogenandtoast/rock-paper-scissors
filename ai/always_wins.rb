module AI
  class AlwaysWins
    def initialize(moves)
      @moves = moves
    end

    def respond_to(player_move)
      winning_move(player_move).label
    end

    private

    def winning_move(player_move)
      name = winning_move_name(player_move)
      @moves.find { |move| move.name == name }
    end

    def winning_move_name(player_move)
      player_move.outcomes.key("loss")
    end
  end
end
