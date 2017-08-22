class Game
  attr_accessor :word_array, :good_letters, :errors
  attr_reader :tries_left
  MAX_ERRORS = 7

  def initialize(word)
    @word_array = word.split('')
    @uniq_letters = @word_array.uniq
    @good_letters = []
    @bad_letters = []
    @status = :in_progress
    @errors = 0
    @tries_left = MAX_ERRORS
  end

  def next_step
    user_input = STDIN.gets.chomp.downcase
    if was_typed?(user_input)
      puts ">> Букву \"#{user_input}\" вы уже набирали <<"
      return
    end
    check_letter(user_input)
  end


  def check_letter(user_input)
    @tries_left -= 1
    extra_letter = case user_input
                   when 'е' then 'ё'
                   when 'ё' then 'е'
                   when 'и' then 'й'
                   when 'й' then 'и'
                   end
    unless extra_letter.nil?
      @good_letters << extra_letter
      @uniq_letters << extra_letter
    end

    if @uniq_letters.include?(user_input)
      @good_letters << user_input
    else
      unless was_typed?(user_input)
        @bad_letters << user_input
        @errors += 1
      end
    end
    @status = check_status
  end

  def was_typed?(user_input)
    @bad_letters.include?(user_input) || @good_letters.include?(user_input)
  end

  def check_status
    return :won if (@word_array - @good_letters).empty?
    return :lose if @errors >= MAX_ERRORS
    return :in_progress
  end

  def finish?
    @status == :lose || @status == :won
  end
end
