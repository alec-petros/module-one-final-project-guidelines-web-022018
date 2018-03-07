require_relative '../config/environment'

binding.pry

puts "Hello, and welcome to Spotpandorify."
puts "Please enter a username."
user = nil
loop do
  input = gets.chomp
  if User.all_users.include? input
    user = User.find_by(name: input)
    break
  else
    puts "User not found. Would you like to create a new profile? (Y/N)"
    y_n = gets.chomp.downcase
    case y_n
    when 'y'
      user = User.create(name: input)
      user.save
      break
    else
      puts "Please enter a username."
    end
  end
end
loop do
  puts "Logged in as #{user.name}. Please choose a function. Type 'help' for commands."
  input = gets.chomp
  case input.downcase
  when 'exit'
    break
  when /recommend/
    Helper.all_seed(user)
  when /artist/
    user.my_artists
  when /genre/
    user.my_genres
  when /track/
    user.my_tracks
  when 'help'
    puts 'Recommendation - Enter seeds to create recommendation playlist'
    puts 'My Artists - Display all artists you have saved to your profile'
    puts 'My Genres - Display all genres you have saved to your profile'
    puts 'My Tracks - Display all tracks you have saved to your profile'
    puts 'Help - This menu'
    puts 'Exit - Quit the program'
  else
    puts "Please enter a valid command"
  end
end

puts "Goodbye"
