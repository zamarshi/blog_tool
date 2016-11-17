class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]


  def new
    @post = Post.new
    @post.user = current_user
    @categories = Category.all
  end

  def create
    post_params = params.require(:post).permit([:title, :body, :user_id,
                                                :category_id, tag_ids: []])
    @post = Post.new post_params
    @post.user = current_user
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
      end
  end

  def show
    @comment = Comment.new
    @post = Post.find params[:id]
  end

  WillPaginate.per_page = 10

  def index
      if params[:search]
        @post_search = Post.all.search(params[:search]).order("title ASC").paginate(:page => params[:page])
      else
        @post_search = Post.all.order('title ASC').paginate(:page => params[:page])
      end
    end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit([:title, :body, :user_id,
                                                :category_id, tag_ids: []])

    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  private

  def authorize_access
    unless can? :manage, @post
      redirect_to home_path, notice: "Access denied"
    end
  end

end
