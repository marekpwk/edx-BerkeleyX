module FunWithStrings
  def palindrome?
    word = self.downcase.split("").delete_if{|letter| !letter.match(/[a-zA-Z]/)}.join
    word == word.reverse ? true : false
  end

  def count_words
    count = {}
    string_to_array = self.lstrip.downcase.split(/\W+/)
    string_to_array.each {|word| count.include?(word) ? count[word] += 1 : count[word] = 1}
    count
  end


  def is_anagram?(word)
   return self.split("").sort == word.split("").sort if self.length == word.length
   return false
  end

  def anagram_groups
    groups = []
    string_to_array = self.split(" ")
      while string_to_array.length > 0
          first_word = string_to_array[0]
          sub_group = string_to_array.find_all { |word2| first_word.is_anagram?(word2) }
          groups << sub_group if !sub_group.empty?
          string_to_array.delete_if {|item| sub_group.include?(item)}
       end
    groups
  end

end

class String
  include FunWithStrings
end

# a = "scream cars for four scar creams"
# puts a.anagram_groups
w = "scream cars for four scar creams"
puts w.anagram_groups.inspect
