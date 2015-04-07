require 'rails_helper'

feature "User playing the game" do
  xscenario "when user wins game" do
    visit '/games/new'

    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end

  xscenario "when user loses game" do
    visit '/games/new'

    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end
end

feature "User visits website" do
  scenario "sees a list of games and can view them"

  scenario "can start a new game"
end
