# frozen_string_literal: true

WORDY_PTS = %w[Love Fifteen Thirty Forty].freeze
WORDY_ALL = %w[Love-All Fifteen-All Thirty-All].freeze

Player = Struct.new(:name, :points) do
  def wordy_points
    WORDY_PTS[points]
  end
end

class TennisGame1
  def initialize(a_name, b_name)
    @a = Player.new(a_name, 0)
    @b = Player.new(b_name, 0)
  end
        
  def won_point(name)
    name == 'player1' ? @a.points += 1 : @b.points += 1
  end
  
  def advantage_or_win(score_diff)
    case score_diff
    when 1
      'Advantage player1'
    when -1
      'Advantage player2'
    when (2..)
      'Win for player1'
    else
      'Win for player2'
    end
  end
  
  def score
    return WORDY_ALL[@a.points] || "Deuce" if @a.points == @b.points
    
    return "#{@a.wordy_points}-#{@b.wordy_points}" if @a.points < 4 && @b.points < 4
    
    advantage_or_win(@a.points - @b.points)
  end
end

# class TennisGame2
#   def initialize(player1Name, player2Name)
#     @player1Name = player1Name
#     @player2Name = player2Name
#     @p1points = 0
#     @p2points = 0
#   end
#
#   def won_point(playerName)
#     if playerName == @player1Name
#       p1Score()
#     else
#       p2Score()
#     end
#   end
#
#   def score
#     result = ""
#     if (@p1points == @p2points and @p1points < 3)
#       if (@p1points==0)
#         result = "Love"
#       end
#       if (@p1points==1)
#         result = "Fifteen"
#       end
#       if (@p1points==2)
#         result = "Thirty"
#       end
#       result += "-All"
#     end
#     if (@p1points==@p2points and @p1points>2)
#         result = "Deuce"
#     end
#
#     p1res = ""
#     p2res = ""
#     if (@p1points > 0 and @p2points==0)
#       if (@p1points==1)
#         p1res = "Fifteen"
#       end
#       if (@p1points==2)
#         p1res = "Thirty"
#       end
#       if (@p1points==3)
#         p1res = "Forty"
#       end
#       p2res = "Love"
#       result = p1res + "-" + p2res
#     end
#     if (@p2points > 0 and @p1points==0)
#       if (@p2points==1)
#         p2res = "Fifteen"
#       end
#       if (@p2points==2)
#         p2res = "Thirty"
#       end
#       if (@p2points==3)
#         p2res = "Forty"
#       end
#
#       p1res = "Love"
#       result = p1res + "-" + p2res
#     end
#
#     if (@p1points>@p2points and @p1points < 4)
#       if (@p1points==2)
#         p1res="Thirty"
#       end
#       if (@p1points==3)
#         p1res="Forty"
#       end
#       if (@p2points==1)
#         p2res="Fifteen"
#       end
#       if (@p2points==2)
#         p2res="Thirty"
#       end
#       result = p1res + "-" + p2res
#     end
#     if (@p2points>@p1points and @p2points < 4)
#       if (@p2points==2)
#         p2res="Thirty"
#       end
#       if (@p2points==3)
#         p2res="Forty"
#       end
#       if (@p1points==1)
#         p1res="Fifteen"
#       end
#       if (@p1points==2)
#         p1res="Thirty"
#       end
#       result = p1res + "-" + p2res
#     end
#     if (@p1points > @p2points and @p2points >= 3)
#       result = "Advantage " + @player1Name
#     end
#     if (@p2points > @p1points and @p1points >= 3)
#       result = "Advantage " + @player2Name
#     end
#     if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
#       result = "Win for " + @player1Name
#     end
#     if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
#       result = "Win for " + @player2Name
#     end
#     result
#   end
#
#   def setp1Score(number)
#     (0..number).each do |i|
#         p1Score()
#     end
#   end
#
#   def setp2Score(number)
#     (0..number).each do |i|
#       p2Score()
#     end
#   end
#
#   def p1Score
#     @p1points +=1
#   end
#
#   def p2Score
#     @p2points +=1
#   end
# end
#
class TennisGame3
  def initialize(a_name, b_name)
    @a = Player.new(a_name, 0)
    @b = Player.new(b_name, 0)
  end

  def won_point(player_name)
    player_name == @a.name ? @a.points += 1 : @b.points += 1
  end

  def score
    if @a.points < 4 && @b.points < 4 && (@a.points + @b.points) < 6
      s = WORDY_PTS[@a.points]
      @a.points == @b.points ? s + "-All" : s + "-" + WORDY_PTS[@b.points]
    elsif @a.points == @b.points
      "Deuce"
    else
      who = @a.points > @b.points ? @a.name : @b.name
      diff = @a.points - @b.points
      diff * diff == 1 ? "Advantage " + who : "Win for " + who
    end
  end
end
