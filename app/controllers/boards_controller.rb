class BoardsController < ApplicationController
  def index
    @boards = Board.all.order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    client_ip =  request.remote_ip
    today =  Date.today.to_s    
    user_id = Digest::SHA256.hexdigest(board_params[:title] + client_ip + today)[0, 8]
    
    @board = Board.new({user_id: user_id}.merge(board_params))
    if @board.save
      redirect_to @board
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def board_params
      params.require(:board).permit(:title, :description, :user_id)
    end
end
