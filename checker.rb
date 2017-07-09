#Данный класс занимается проверкой введенного значения.
# Он при инициализации получает список букв и далее проверяет
# в методе check_letter есть ли там введенное значение user_input
# В себе хранит список удачных и неудачных попыток.
# Если пользователь повторно ввел неверную букву - прощаем ему эту попытку

class Checker
  def initialize(uniq_letters)
    @uniq_letters = uniq_letters.uniq!
    @good_letters = []
    @bad_letters = []
    @user_input = nil
    @changed_word = nil
  end


# lsdjflsadjfalsjfaljfdalsjfdaf


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
      # Не различать "е" и "ё"
    # puts "class Checker user_input = #{user_input}" #---------- test
    # Проверка буквы на наличие в массиве уникальных букв
    if @uniq_letters.include?(@user_input)
      # Добавляем букву в массив угаданных букв
      # puts "В слове #{word} есть буква #{user_input}"
      @good_letters << @user_input
      puts "@good_letters << #{@user_input}"
    else
      @bad_letters << @user_input
      puts "@bad_letters << #{@user_input}"
    end
  end

  # Не различать "е" и "ё"
  # def e_check(user_input)
  #   # puts "class e_check user_input = #{user_input}" #---------- test
  #   @user_input = "е" if (user_input == "ё" && !@uniq_letters.include?("ё"))
  # end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def uniq_letters
    @uniq_letters
  end

  # Если введенная буква уже была введена и не верна - возвращает false
  def new_letter?(user_input)
    new_letter = !@bad_letters.include?(user_input)
  end

end
