OUTCOMES = {
  %w(R P) => "AI wins",
  %w(R S) => "Player wins",
  %w(R R) => "Tie game",
  %w(P S) => "AI wins",
  %w(P R) => "Player wins",
  %w(P P) => "Tie game",
  %w(S R) => "AI wins",
  %w(S P) => "Player wins",
  %w(S S) => "Tie game"
}

print "Your move? (R/P/S, q to quit) > "
player_move = gets.chomp
ai_move = %w(R P S).sample
puts "AI played #{ai_move}"
puts OUTCOMES[[player_move, ai_move]]
