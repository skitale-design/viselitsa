# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


# Массив подходящих и неподходящих букв:
good_letters = []
bad_letters = []
try_counter = 0

require_relative "wordReader"
require_relative "checker"
require_relative "printer"
# Путь до файла со списком слов
path = "./data/word_list_new.txt"
# puts "path = #{path}" #---------- test
# Читаем слова из файла в массив
file = WordReader.new(path)
# Выбираем случайное слов
word = file.word

# puts "file.word = #{file.word}" #---------- test
# Разбиваем слово на массив букв
word_array = word.split("")
word_array.each_with_index do |letter, i| #------------test
  puts "word_array[#{i}] = #{word_array[i]}" #---------- test
end # ---------- test
puts "word_array = #{word_array}" #---------- test
uniq_letters = word_array.uniq
# puts "uniq_letters = #{uniq_letters}" #---------- test
# puts "word_array.size = #{word_array.size}" #---------- test

checker = Checker.new(uniq_letters)
printer = Printer.new
# В цикле N раз запрашиваем у пользователя буквы
puts "В слове #{uniq_letters.size} уникальных букв - у вас #{uniq_letters.size} попыток:"
user_input = nil
try_counter = uniq_letters.size
i = 0
loop do
    print "Введите букву:"
    # получаем букву пользователя downcase убирает зависимость от регистра букв:
    user_input = STDIN.gets.chomp.downcase
    checker.check_letter(user_input)
    # Увеличиваем счетчик попыток только если введенная буква раньше не вводилась
    i+=1 if checker.new_letter?(user_input)
    # Если буква есть в слове, то печатаем ее на экране, а другие помечаем прочерком
    puts "checker.good_letters = #{checker.good_letters}" #----------- test
    puts "checker.uniq_letters = #{checker.uniq_letters}" #----------- test
    printer.rezult(user_input, word_array, checker.good_letters)
    puts
    puts "(word_array - checker.good_letters).empty? = #{(word_array - checker.good_letters).empty?}"
  break if (word_array - checker.good_letters).empty?
end

puts "\nСлово было \"#{word}\""
