class Hangman

  attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
     DICTIONARY.sample
  end

  def initialize
    random = Hangman.random_word
    @secret_word = random
    @guess_word = random.gsub(/[A-Za-z]/,"_").split("")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)

      if @attempted_chars.include?(char)
        return true
      else
        return false
      end

  end

  def get_matching_indices(char)

    ind = []

    @secret_word.each_char.with_index { |x,idx| ind << idx if x == char }
          
    ind

  end


  def fill_indices(char,arr)
    arr.each { |idx| @guess_word[idx] = char}

  end

  def try_guess(char)
    if already_attempted?(char) == true
      print 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end

    if get_matching_indices(char) == true
      @remaining_incorrect_guesses -= 1
    end


  end

  def ask_user_for_guess
    print 'Enter a char:' 
    input = gets.chomp
    try_guess(input)




  end

  def win?
    if  @guess_word == @secret_word
      print 'WIN'
      return true 
      
   
    end

   

  end

  def lose?
    if @remaining_incorrect_guesses = 0
      print 'LOSE'
      return true
    else
      return false
    
    end
  end

  def game_over?
    

  end



end
