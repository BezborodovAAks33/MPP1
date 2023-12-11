def play_game(player_choice, computer_choice)
  puts "Player chose: #{player_choice}"
  puts "Computer chose: #{computer_choice}"

  if player_choice == computer_choice
    puts "It's a tie!"
  elsif (player_choice == "Stone" && computer_choice == "Scissors") ||
        (player_choice == "Paper" && computer_choice == "Stone") ||
        (player_choice == "Scissors" && computer_choice == "Paper")
    puts "You win!"
  else
    puts "You lose!"
  end
end

if ARGV.length != 2
  puts "Usage: ruby game.rb <player_choice> <computer_choice>"
else
  player_choice = ARGV[0].capitalize
  computer_choice = ARGV[1].capitalize

  play_game(player_choice, computer_choice)
end
