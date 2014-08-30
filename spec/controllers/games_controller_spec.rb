require 'rails_helper'

describe GamesController do
  let!(:game) { Game.create!(user_throw: Game::THROWS.sample) }

  describe "GET #index" do
    it "assigns all games as @games" do
      pending
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      get :show, { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end

    it "assigns winner throw" do
      pending
    end

    it "assigns loser throw" do
      pending
    end
  end

  describe "GET #new" do
    pending
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new Game" do
        pending
      end

      it "assigns a newly created game as @game" do
        pending
      end

      it "redirects to the created game" do
        pending
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved game as @game" do
        pending
      end

      it "re-renders the 'new' template" do
        pending
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested game as @game" do
      delete :destroy, { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end

    it "destroys the requested game" do
      expect {
        delete :destory, id: game.id
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      pending
    end
  end

end
