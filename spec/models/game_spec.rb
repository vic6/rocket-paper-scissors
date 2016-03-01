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
      it "is valid when it's rock" do
        game.computer_throw = 'rock'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's paper" do
        game.computer_throw = 'paper'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is valid when it's scissors" do
        game.computer_throw = 'scissors'
        game.valid?
        expect(game.errors[:computer_throw]).to be_empty
      end

      it "is NOT valid when it's rocket" do
        game.computer_throw = 'rocket'
        game.valid?
        expect(game.errors[:computer_throw]).to_not be_empty
      end
    end
  end

  describe "#user_throw" do
    pending
  end

  describe "#winner" do
    context "when computer_throw is paper" do
      before do
        game.computer_throw = 'paper'
      end

      it "determines computer won if user_throw is rock" do
        game.user_throw = 'rock'
        expect(game.winner).to eq('computer')
      end

      it "determines user won if user_throw is scissors" do
        game.user_throw = 'scissors'
        expect(game.winner).to eq('user')
      end
    end

    context "when computer throws rock" do
      pending
    end

    context "when computer throws scissors" do
      pending
    end

    describe "validations" do
      pending
    end
  end
end
