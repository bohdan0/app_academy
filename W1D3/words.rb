class WordChainer
  attr_reader :dictionary

  def self.create_dictionary(dict_file_name)
    File.readlines(dict_file_name).map(&:chomp)
  end

  def initialize(dict_file_name = 'dictionary.txt')
    @dictionary = WordChainer.create_dictionary(dict_file_name)
  end

  def adjacent_words(word)
    @dictionary = @dictionary.select { |line| word.length == line.length }
    
  end
end
