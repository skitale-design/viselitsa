class Game

  attr_accessor :word_array, :good_letters

  def initialize(word)
    @word_array = word.split('')
    @uniq_letters = @word_array.uniq
    @good_letters = []
    @bad_letters = []
    @user_input = nil
    @changed_word = nil
  end

  def check_letter(user_input)
    @user_input = user_input
    extra_letter = case user_input
                      when "е" then "ё"
                      when "ё" then "е"
                      when "и" then "й"
                      when "й" then "и"
                    end
      if extra_letter != nil
        @good_letters << extra_letter
      end
      puts "@good_letters << #{extra_letter}"
    # puts "class Game user_input = #{user_input}" #---------- test
    if @uniq_letters.include?(@user_input)
      @good_letters << @user_input
      puts "@good_letters << #{@user_input}"
    else
      @bad_letters << @user_input
      puts "@bad_letters << #{@user_input}"
    end
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def uniq_letters
    @uniq_letters
  end

  def new_letter?(user_input)
    new_letter = !@bad_letters.include?(user_input)
  end

  def try_number
    
  end

  def finish?
    
  end

end
