class Game < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(5) }

  THROWS = %w(rock paper scissors)
  PLAYERS = %w(user computer)

  validates :computer_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :user_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :winner, presence: true,
    inclusion: { in: PLAYERS, message: "%{value} is not a valid player" }

  before_validation :throw_for_computer!, on: :create

  def winner
    if throw_beats?(computer_throw, user_throw)
      'computer'
    else
      'user'
    end
  end

  def winner_throw
    case winner
    when "user"
      user_throw
    when "computer"
      computer_throw
    end
  end

  def loser_throw
    case winner
    when "user"
      computer_throw
    when "computer"
      user_throw
    end
  end

  def throw_for_computer!
    self.computer_throw ||= THROWS.sample
  end

  private
  def throw_beats?(first_throw, other_throw)
    return true if first_throw == 'paper' && other_throw == 'rock'
    return true if first_throw == 'scissors' && other_throw == 'paper'
    return true if first_throw == 'rock' && other_throw == 'scissors'
    false
  end
end
