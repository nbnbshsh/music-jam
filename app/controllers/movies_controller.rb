class MoviesController < ApplicationController
  def index
    @movies=Movie.all
  end
    
  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.new(movie_params)
    if @movie.valid? 
      @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
     @movie=Movie.find(params[:id])
  end

  private

  def movie_params
     params.require(:movie).permit(:text,:instrument,:music,:artist,:video_top).merge(user_id: current_user.id)
  end



end
