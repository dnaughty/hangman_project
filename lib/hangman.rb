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
    
    if get_matching_indices(char).true?
      print 'that has already been attempted'
    end


  end

end
