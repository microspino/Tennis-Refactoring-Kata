# frozen_string_literal: true

WORDY_PTS = %w[Love Fifteen Thirty Forty].freeze
WORDY_ALL = %w[Love-All Fifteen-All Thirty-All].freeze

Player = Struct.new(:name, :points) do
  def wordy_points; WORDY_PTS[points]; end
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
    name == @a.name ? @a.points +=1 : @b.points +=1
  end

  def score
    return "Deuce" if @a.points == @b.points && @a.points > 2

    w = ["Love", "Fifteen", "Thirty", "Forty"]
    return w[@a.points] + "-All" if @a.points == @b.points && @a.points < 3
    
    diff = @a.points - @b.points

    if (1..3).cover? diff
      return "#{w[@a.points]}-Love" if @b.points.zero?
      return "Love-#{w[@b.points]}" if @a.points.zero?
    end
    
    return "Win for #{@a.name}" if @a.points >= 4 && diff >= 2
    return "Win for #{@b.name}" if @b.points >= 4 && diff <= -2
    return "Advantage #{@a.name}" if @b.points >= 3 && diff > 0
    return "Advantage #{@b.name}" if @a.points >= 3 && diff < 0
    
    "#{w[@a.points]}-#{w[@b.points]}"
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
