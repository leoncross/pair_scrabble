class Scrabble
  @@character_score = {
    "a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
    "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
    "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
    "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
    "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" => 10,
    "z" => 10, "" => 0, " \t\n" => 0, nil => 0
  }

  def initialize(word)
    word == nil || word == " \t\n" ? word = " " : word = word
    @word = word.downcase
    word_to_letter
  end

  def word_to_letter
    @individual_letters = @word.split('')
    @result = []
    iterate_through_word
  end

  def iterate_through_word
    @individual_letters.each do |letter_score|
      @result.push @@character_score[letter_score]
    end
  end

  def score
    return @result.inject(:+).to_i
  end
end


scrabble = Scrabble.new(nil)
scrabble.score
