class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @winner_throw = @game.winner_throw
    @loser_throw = @game.loser_throw
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
  def game_params
    params.require(:game).permit(:user_throw)
  end
end
