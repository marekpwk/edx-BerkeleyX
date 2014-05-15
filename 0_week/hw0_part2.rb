def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(s)
  return false if s.empty?
  return false if /[a,e,i,o,u]/i.match(s[0]) || !/[a-zA-Z]/.match(s[0])
  return true
end

def binary_multiple_of_4?(s)
  return false if s.empty?
  s.each_char do |char|
    return false if !/["1","0"]/.match(char)
  end
  s.to_i(2) % 4 == 0 ? true : false
end

puts binary_multiple_of_4?("0")
