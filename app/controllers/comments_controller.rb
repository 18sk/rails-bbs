class CommentsController < ApplicationController
  include Userid

  def create
    @comment = Comment.new(comment_params.slice(:text, :board_id))
    @comment.user_id = generate_user_id(comment_params[:title], request.remote_ip)

    if @comment.save
      redirect_to board_path(@comment.board_id)
    else
      render 'boards/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :board_id, :title)
  end
end
