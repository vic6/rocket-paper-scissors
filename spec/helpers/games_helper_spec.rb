require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe GamesHelper do
  describe "#winner_action" do
    context "when winner throw is paper" do
      before do
        assign(:winner_throw, 'paper')
      end

      it "returns covers when loser threw rock" do
        assign(:loser_throw, 'rock')
        expect(helper.winner_action).to eq("covers")
      end
    end

    context "when winner throw is scissors" do
      pending
    end

    context "when winner throw is rock" do
      pending
    end
  end

  describe "#throw_color" do
    pending
  end

  describe "#throw_fa_icon" do
    pending
  end

end
