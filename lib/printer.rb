class Printer
  IMAGE_PATH = 'image'

  def initialize(game)
    @game = game
  end

  def print_info
    @game.word_array.each do |letter|
      if @game.good_letters.include?(letter)
        print " #{letter} "
      else
        print " _ "
      end
    end
  end

  def print_image
    begin
      File.readlines("#{IMAGE_PATH}/#{@game.errors}.txt", '\n').map {|x| puts x}
    rescue Errno::ENOENT => e
      abort "\n\nОшибка! Не найден файл #{"#{IMAGE_PATH}/#{@game.errors}.txt"} : #{e.message}"
    end
  end
end
