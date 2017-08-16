require_relative "lib/wordReader"
require_relative "lib/game"
require_relative "lib/printer"

path = "./data/word_list_new.txt"
file = WordReader.new(path)
word = file.word

game = Game.new(word)
printer = Printer.new(game)
puts "У вас 7 попыток:"
user_input = nil

loop do
  print "\n Попытка №#{game.try_number} Введите букву:"
  user_input = STDIN.gets.chomp.downcase
  game.check_letter(user_input)
  printer.print_info
  break if game.finish?
end

puts "\nСлово было \"#{word}\""
