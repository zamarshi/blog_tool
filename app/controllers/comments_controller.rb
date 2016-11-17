class CommentsController < ApplicationController

    # before_action :authorize_access
    # before_action :authenticate_user, except: [:index, :show]

  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body, :post_id)
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created!'
    else
      render 'posts/show'
    end
  end

  def destroy
    post = Post.find params[:post_id]
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path(post), notice: 'Comment deleted'
  end

  private

  # def authorize_access
  #   unless can? :delete, @comment
  #     redirect_to home_path, notice: "Access denied"
  #   end
  # end




end
