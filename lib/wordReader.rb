class WordReader
  def initialize(path)
    file = File.new(path, "r:UTF-8")
    word_list = file.readlines
    file.close
    @word = word_list.sample.chomp
  end

  def word
    @word
  end
end
