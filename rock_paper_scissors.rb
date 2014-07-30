require_relative "move"
require_relative "prompt"
require_relative "scorer"

%w(random always_wins always_loses).each do |ai|
  require_relative "ai/#{ai}"
end

class RockPaperScissors

  QUIT = 'q'
  DEFAULT_AIS = {
    "winning" => AI::AlwaysWins,
    "losing" => AI::AlwaysLoses,
    "random" => AI::Random
  }

  def initialize(options)
    @options = options
    @possible_ais = options[:possible_ais] || DEFAULT_AIS
    @moves = options.fetch(:moves)
    @ai = get_ai_class.new(@moves)
    @scorer = options[:scorer] || Scorer.new
  end

  def play
    choice = get_player_choice
    while choice != QUIT
      play_round(choice)
      choice = get_player_choice
    end
  end

  private

  attr_reader :ai, :options, :possible_ais, :scorer

  def get_ai_class
    message =  "Choose an AI (#{possible_ais.keys.join("/")})"
    valid_options = possible_ais.keys
    choice = Prompt.new(message, valid_options).gets
    possible_ais[choice]
  end

  def play_round(choice)
    player_move = move_from_label(choice)
    ai_move = get_ai_move(player_move)
    display_result(player_move, ai_move)
    display_statistics
  end

  def get_player_choice
    valid_options = labels + [QUIT]
    message = "Your move? (#{labels.join("/")}, q to quit)"
    Prompt.new(message, valid_options).gets
  end

  def labels
    @moves.map(&:label)
  end

  def move_from_label(label)
    @moves.find { |move| move.label == label }
  end

  def get_ai_move(player_move)
    label = ai.respond_to(player_move)
    puts "AI played #{label}"
    move_from_label(label)
  end

  def display_result(player_move, ai_move)
    puts scorer.score(player_move.outcomes[ai_move.name])
  end

  def display_statistics
    percent = scorer.percentage_of_wins
    puts "You won #{percent.round}% of hands so far"
    puts
  end
end
