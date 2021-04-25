class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(movie_id: params[:movie_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @like = current_user.likes.find_by(movie_id: @movie.id)
    @like.destroy
     redirect_back(fallback_location: root_path)
  end


  def show
    @likes = current_user.likes.all
  end

  private


end
