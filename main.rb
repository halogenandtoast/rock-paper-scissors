require "yaml"
require_relative "rock_paper_scissors"

# If you'd like to play the rock/paper/scissors/lizard/spock
# variant call this file like so:
#
#   ruby main.rb spock.yml

yaml = YAML.load_file(ARGV[0] || "config.yml")
moves = yaml.map { |options| Move.new(options) }

RockPaperScissors.new(moves: moves).play
