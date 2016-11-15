class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = Favorite.new(post: @post, user: current_user)
    if @favorite.save
      redirect_to :back, notice: 'Post favorited!'
    else
      redirect_to :back, alert: 'Unable to favorite'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
    redirect_to :back, notice: 'Post unfavorited'
    else
    redirect_to :back, alert: 'Unable to remove favorite'
    end
  end
end
