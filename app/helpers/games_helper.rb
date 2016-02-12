module GamesHelper

  def winner_action
    return "confuses" if @winner_throw == 'paper' && @loser_throw == 'rock'
    return "cut" if @winner_throw == 'scissors' && @loser_throw == 'paper'
    return "melts" if @winner_throw == 'rock' && @loser_throw == 'scissors'
  end

  def throw_color(throw)
    return "danger" if throw == 'rock'
    return "success" if throw == 'paper'
    return "info" if throw == 'scissors'
  end

  def throw_fa_icon(throw)
    return "fa-hand-rock-o" if throw == "rock"
    return "fa-hand-stop-o" if throw == "paper"
    return "fa-hand-scissors-o" if throw == "scissors"
  end
end
