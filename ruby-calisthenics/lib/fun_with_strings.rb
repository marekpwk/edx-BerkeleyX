module FunWithStrings
  def palindrome?
    word = self.downcase.split("").delete_if{|letter| !letter.match(/[a-zA-Z]/)}.join
    # return false if !word.match(/|[a-zA-Z]/)
    word == word.reverse ? true : false
  end

  def count_words
    count = {}
    string_to_array = self.lstrip.downcase.split(/\W+/)
    string_to_array.each {|word| count.include?(word) ? count[word] += 1 : count[word] = 1}
    count
  end

  def count_letters
    count = {}
    word_to_array = self.lstrip.downcase.split("")
    word_to_array.each {|word| count.include?(word) ? count[word] += 1 : count[word] = 1}
    count
  end

  def is_anagram?(word)
    if self.length == word.length
     return self.count_letters == word.count_letters
    end
    return false
  end

  def anagram_groups
    groups = []
    string_to_array = self.split(" ")
    puts string_to_array.inspect
    string_to_array.each do |word|
      groups << string_to_array.take_while{|w| w.is_anagram?(word)}
    end
    puts groups.inspect
  end

end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

# a = "scream cars for four scar creams"
# puts a.anagram_groups
w = "scream cars for four scar creams"
puts w.anagram_groups.inspect