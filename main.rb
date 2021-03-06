require_relative "lib/word_reader"
require_relative "lib/game"
require_relative "lib/printer"

path = "./data/word_list.txt"
file = WordReader.new(path)
word = file.word

game = Game.new(word)
printer = Printer.new(game)
puts "Загаданное слово состоит из #{word.size} букв"
printer.print_info

loop do
  print "\n Попыток осталось: #{game.tries_left} Введите букву:"
  game.next_step
  printer.print_info
  printer.print_image
  break if game.finish?
end

puts "\nСлово было \"#{word}\""
