# frozen_string_literal: true

WORDY_PTS = %w[Love Fifteen Thirty Forty].freeze
WORDY_ALL = %w[Love-All Fifteen-All Thirty-All].freeze

Player = Struct.new(:name, :points) do
  def wordy_points; WORDY_PTS[points]; end
  def incr!; self.points +=1; end 
end

# class TennisGame1
#   def initialize(a_name, b_name)
#     @a = Player.new(a_name, 0)
#     @b = Player.new(b_name, 0)
#   end
#
#   def won_point(name)
#     name == 'player1' ? @a.points += 1 : @b.points += 1
#   end
#
#   def advantage_or_win(score_diff)
#     case score_diff
#     when 1
#       'Advantage player1'
#     when -1
#       'Advantage player2'
#     when (2..)
#       'Win for player1'
#     else
#       'Win for player2'
#     end
#   end
#
#   def score
#     return WORDY_ALL[@a.points] || "Deuce" if @a.points == @b.points
#
#     return "#{@a.wordy_points}-#{@b.wordy_points}" if @a.points < 4 && @b.points < 4
#
#     advantage_or_win(@a.points - @b.points)
#   end
# end

class TennisGame2
  def initialize(a_name, b_name)
    @a = Player.new(a_name, 0)
    @b = Player.new(b_name, 0)
  end

  def won_point(name)
    name == @a.name ? @a.incr! : @b.incr!
  end

  def score
    result = ""
    
    if (@a.points > @b.points and @b.points >= 3)
      result = "Advantage " + @a.name
    end
    
    if (@b.points > @a.points and @a.points >= 3)
      result = "Advantage " + @b.name
    end
    
    if (@a.points>=4 and @b.points>=0 and (@a.points-@b.points)>=2)
      result = "Win for " + @a.name
    end
    
    if (@b.points>=4 and @a.points>=0 and (@b.points-@a.points)>=2)
      result = "Win for " + @b.name
    end
    
    puts "ne advantage ne win"
    
    puts "#{@a.points} - #{@b.points}"
    
    if @a.points == @b.points && @a.points < 3
      result = ["Love", "Fifteen", "Thirty"][@a.points]
      result += "-All"
      return result
    end
    
    return "Deuce" if @a.points == @b.points && @a.points > 2

    if @a.points > 0 && @b.points == 0 && @a.points < 4
      a_score = ["--", "Fifteen", "Thirty", "Forty"][@a.points]
      result = "#{a_score}-Love"
      return result
    end
    
    if @b.points > 0 && @a.points == 0 && @b.points < 4
      b_score = ["--", "Fifteen", "Thirty", "Forty"][@b.points]
      result = "Love-#{b_score}"
      return result
    end
    

    if (@a.points>@b.points and @a.points < 4)
      if (@a.points==2)
        p1res="Thirty"
      end
      if (@a.points==3)
        p1res="Forty"
      end
      if (@b.points==1)
        p2res="Fifteen"
      end
      if (@b.points==2)
        p2res="Thirty"
      end

      result = p1res + "-" + p2res
      return result
    end
    
    if (@b.points>@a.points and @b.points < 4)
      if (@b.points==2)
        p2res="Thirty"
      end
      if (@b.points==3)
        p2res="Forty"
      end
      if (@a.points==1)
        p1res="Fifteen"
      end
      if (@a.points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
      
      return result
    end
    
    result
  end
end

# class TennisGame3
#   def initialize(a_name, b_name)
#     @a = Player.new(a_name, 0)
#     @b = Player.new(b_name, 0)
#   end
#
#   def won_point(player_name)
#     player_name == @a.name ? @a.points += 1 : @b.points += 1
#   end
#
#   def advantage?
#     diff =  @a.points - @b.points
#     diff * diff == 1
#   end
#
#   def tie?
#     @a.points == @b.points
#   end
#
#   def score
#     return "Deuce" if tie? && @a.points >= 3
#     return "#{@a.wordy_points}-All" if tie? && @a.points < 4
#
#     if @a.points < 4 && @b.points < 4
#       "#{@a.wordy_points}-#{@b.wordy_points}"
#     else
#       x = [@a, @b].max_by(&:points)
#       advantage? ? "Advantage #{x.name}" : "Win for #{x.name}"
#     end
#   end
# end
