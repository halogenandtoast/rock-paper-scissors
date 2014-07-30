class Scorer
  OUTCOMES = {
    "win" => "Player wins",
    "loss" => "AI wins",
    "tie" => "Tie game"
  }

  def initialize
    @log = []
  end

  def score(result)
    @log << result
    OUTCOMES[result]
  end

  def percentage_of_wins
    (@log.count("win").to_f / @log.length) * 100
  end
end
