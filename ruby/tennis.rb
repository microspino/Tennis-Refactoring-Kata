# frozen_string_literal: true

WORDY_PTS = %w[Love Fifteen Thirty Forty].freeze
WORDY_ALL = %w[Love-All Fifteen-All Thirty-All].freeze

Player = Struct.new(:name, :points) do
  def wordy_points
    WORDY_PTS[points]
  end
end

# Game 1: using case-when
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
    return WORDY_ALL[@a.points] || 'Deuce' if @a.points == @b.points

    return "#{@a.wordy_points}-#{@b.wordy_points}" if @a.points < 4 && @b.points < 4

    advantage_or_win(@a.points - @b.points)
  end
end

# Game 2: using return keyword a lot
class TennisGame2
  def initialize(a_name, b_name)
    @a = Player.new(a_name, 0)
    @b = Player.new(b_name, 0)
  end

  def won_point(name)
    name == @a.name ? @a.points += 1 : @b.points += 1
  end

  def diff
    @a.points - @b.points
  end

  def tie?
    @a.points == @b.points
  end

  def deuce
    return unless tie? && @a.points >= 3

    'Deuce'
  end

  def love
    return unless (1..3).cover?(diff) && (@a.points.zero? || @b.points.zero?)

    @b.points.zero? ? "#{WORDY_PTS[@a.points]}-Love" : "Love-#{WORDY_PTS[@b.points]}"
  end

  def display_score
    "#{WORDY_PTS[@a.points]}-#{WORDY_PTS[@b.points]}"
  end

  def all
    return unless tie? && @a.points < 3

    "#{WORDY_PTS[@a.points]}-All"
  end

  def prefix
    diff.abs >= 2 ? 'Win for' : 'Advantage'
  end

  def win?
    @a.points >= 4 && @b.points <= 2 || @b.points >= 4 && @a.points <= 2
  end

  def advantage?
    @b.points >= 3 && diff.positive? || @a.points >= 3 && diff.negative?
  end

  def best_player_name
    [@a, @b].max_by(&:points).name
  end

  def win
    "#{prefix} #{best_player_name}" if win?
  end

  def advantage
    "#{prefix} #{best_player_name}" if advantage?
  end

  def score
    deuce || all || love || advantage || win || display_score
  end
end

# Game 3: using methods with a question mark
class TennisGame3
  def initialize(a_name, b_name)
    @a = Player.new(a_name, 0)
    @b = Player.new(b_name, 0)
  end

  def won_point(player_name)
    player_name == @a.name ? @a.points += 1 : @b.points += 1
  end

  def advantage_or_win?
    diff = @a.points - @b.points
    diff * diff == 1 ? 'Advantage' : 'Win for'
  end

  def tie?
    @a.points == @b.points
  end

  def deuce?
    tie? && @a.points >= 3
  end

  def playing?
    @a.points < 4 && @b.points < 4
  end

  def current_score
    "#{@a.wordy_points}-#{@b.wordy_points}"
  end

  def score
    if deuce?
      'Deuce'
    elsif tie? && @a.points < 4
      "#{@a.wordy_points}-All"
    elsif playing?
      current_score
    else
      x = [@a, @b].max_by(&:points)
      "#{advantage_or_win?} #{x.name}"
    end
  end
end
