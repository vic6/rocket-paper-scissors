require 'rails_helper'

describe Game do
  let(:game) { Game.new }

  describe "#recent" do
    pending
  end

  describe "#throw_for_computer!" do
    skip "sets computer_throw" do
    end

    skip "only sets the computer_throw once" do
    end
  end

  describe "#computer_throw" do
    describe "validations" do
      it "is valid when it's rocket" do
        game.computer_throw = 'rocket'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's paper-plane" do
        game.computer_throw = 'paper-plane'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's scissors" do
        game.computer_throw = 'scissors'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is NOT valid when it's rock" do
        game.computer_throw = 'rock'
        game.valid?
        expect(game.errors[:computer_throw]).to_not be_empty
      end
    end
  end

  describe "#user_throw" do
    pending
  end

  describe "#winner" do
    it "sets a winner when saved" do
      game.user_throw = 'rocket'
      game.save
      expect(game.winner).to be_truthy
    end

    skip "only sets the winner once" do
    end

    describe "validations" do
      pending
    end
  end

  describe "#winner" do
    context "when computer_throw is paper-plane" do
      before do
        game.computer_throw = 'paper-plane'
      end

      it "determines computer won if user_throw is rocket" do
        game.user_throw = 'rocket'
        expect(game.winner).to eq('computer')
      end

      it "determines user won if user_throw is scissors" do
        game.user_throw = 'scissors'
        expect(game.winner).to eq('user')
      end
    end

    context "when computer throws rocket" do
      pending
    end

    context "when computer throws scissors" do
      pending
    end
  end
end
