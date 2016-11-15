class FavouritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favourite = Favourite.new(post: @post, user: current_user)
    if @favourite.save
      redirect_to :back, notice: 'Post favourited!'
    else
      redirect_to :back, alert: 'Unable to favourite'
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    if @favourite.destroy
    redirect_to :back, notice: 'Post unfavourited'
    else
    redirect_to :back, alert: 'Unable to remove favourite'
    end
  end
end
