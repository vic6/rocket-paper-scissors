module GamesHelper

  def winner_action
    return "confuses" if @winner_throw == 'paper-plane' && @loser_throw == 'rocket'
    return "cut" if @winner_throw == 'scissors' && @loser_throw == 'paper-plane'
    return "melts" if @winner_throw == 'rocket' && @loser_throw == 'scissors'
  end

  def throw_color(throw)
    return "danger" if throw == 'rocket'
    return "success" if throw == 'paper-plane'
    return "info" if throw == 'scissors'
  end

  def throw_fa_icon(throw)
    return "fa-hand-rock-o" if throw == "rocket"
    return "fa-hand-stop-o" if throw == "paper-plane"
    return "fa-hand-scissors-o" if throw == "scissors"
  end
end
