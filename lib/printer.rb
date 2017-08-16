class Printer

  def initialize(game)
    @good_letters = game.good_letters
    @word_array = game.word_array
    @errors = game.errors
  end

  def print_info
      @word_array.each do |letter|
        if @good_letters.include?(letter)
          print " #{letter} "
        else
          print " _ "
        end
      end
  end
end
