class BoardsController < ApplicationController
  def index
    @boards = Board.all.order(created_at: :desc)
  end

  def new
    @board = Board.new
    @board.comments.build
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    user_id = user_id(request.remote_ip)

    @board = Board.new(board_params)
    @board.comments[0].user_id = user_id

    if @board.save
      puts 'success!!!'
      redirect_to @board
    else
      puts 'failure!!!'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, comments_attributes: [:text, :user_id])
  end

  def user_id(client_ip)
    today = Date.today.to_s
    Digest::SHA256.hexdigest(board_params[:title] + client_ip + today)[0, 8]
  end
end
