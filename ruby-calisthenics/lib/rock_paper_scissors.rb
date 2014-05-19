class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ;end

  def initialize

  end

  def self.winner(player1, player2)
    puts "Im in the self.winner"
    moves = ["R", "P", "S"]
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" if !moves.include?(player1[1]) || !moves.include?(player2[1])
    if player1[1] == "R" && player2[1] == "S"
      puts "winner #{player1}"
      return player1
    elsif player1[1] == "S" && player2[1] == "P"
      puts "winner #{player1}"
      return player1
    elsif player1[1] == "P" && player2[1] == "R"
      puts "winner #{player1}"
      return player1
    elsif player1[1] ==player2[1]
      puts "winner #{player1}"
       return player1
    else
      puts "winner #{player2}"
        return player2
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0].is_a?(String)
      puts "first if"
      puts "First array #{tournament[0]} ,second array #{tournament[1]}"
      puts
      return self.winner(tournament[0], tournament[1])
    else
      puts "second if"
      puts "First array #{tournament[0]} ,second array #{tournament[1]}"
       self.winner( self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]) )
    end

  end

end

# game = RockPaperScissors.new()
# # puts RockPape""rScissors.winner(['Armando','P'], ['Dave','S'])  # => ['Dave','S']
tour =[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
puts RockPaperScissors.tournament_winner(tour)