class BoardsController < ApplicationController
  include Userid

  def index
    @boards = Board.page(params[:page]).order(created_at: :desc).per(5)
  end

  def new
    @board = Board.new
    @board.comments.build
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new(board_id: @board.id)
  end

  def create
    user_id = generate_user_id(board_params[:title], request.remote_ip)

    @board = Board.new(board_params)
    @board.comments[0].user_id = user_id

    if @board.save
      redirect_to @board
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def search
    @boards = Board.where('title LIKE ?', "%#{params[:query]}%").page(params[:page]).order(created_at: :desc).per(5)
    render 'index'
  end

  private

  def board_params
    params.require(:board).permit(:title, comments_attributes: [:text, :user_id])
  end
end
