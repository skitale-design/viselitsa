class WordReader
  def initialize(path)
    begin
      file = File.new(path, "r:UTF-8")
      @word_list = file.readlines
      file.close
    rescue(SystemCallError) => e
      abort "Ошибка! #{e.message}"
    end
  end

  def word
    @word_list.sample.chomp
  end
end

# testBranch
