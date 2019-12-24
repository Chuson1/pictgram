class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(content_params)
    if @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      flash[:danger] = "投稿に失敗しました"
      render :new
    end
    
  end
  
  private
    def content_params
      params.require(:comment).permit(:user_id, :topic_id, :content)
    end
end
