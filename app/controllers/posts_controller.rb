class PostsController < ApplicationController

def new
  @post = Post.new
end

def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = 'Post Created!'
      redirect_to post_path(@post)
    else
      # if we juse use flash[:alert] in here then the flash message will persist
      # to the next request as well. flash.now[:alert] will make it only show
      # when you render the `:new` template but it won't persist to the next
      # request
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    if @post.update post_params
          flash[:notice] = 'Post updated'
          redirect_to post_path(@post)
        else
          flash.now[:alert] = 'Please see errors below!'
          render :edit
        end
  end



  def delete
    @post.destroy
      # adding `notice: 'Question deleted'` to the redirect_to line will set a
      # flash notice message as we did the create / update actions
      # note that this only works for redirect and not for render
      redirect_to posts_path, notice: 'Post deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
