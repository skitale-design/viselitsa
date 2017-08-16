require_relative "lib/wordReader"
require_relative "lib/game"
require_relative "lib/printer"

path = "./data/word_list.txt"
file = WordReader.new(path)
word = file.word

game = Game.new(word)
printer = Printer.new(game)

i = 0
loop do
  print "\n #{i} Введите букву:"
  game.next_step
  printer.print_info
  break if game.finish?
  i += 1
end

puts "\nСлово было \"#{word}\""
