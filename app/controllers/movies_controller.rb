class MoviesController < ApplicationController
  before_action :search_movie, only: [:index,:search]

  def index
    @movies=Movie.all
    @users=User.all
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
      render :new
    end
  end

  def show
     @movie=Movie.find(params[:id])
     @comment=Comment.new
     @comments=@movie.comments.includes(:user)
  end

  def edit
     @movie=Movie.find(params[:id])
  end

  def update
    @movie=Movie.find(params[:id])
     if @movie.update(update_params)
       redirect_to movie_path(@movie.id)
     else
       render :edit
     end
  end

  def destroy
    @movie=Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  def search
    @results = @m.result
  end

  private

  def search_movie
    @m=Movie.ransack(params[:q])
  end

  def movie_params
     params.require(:movie).permit(:text,:instrument,:music,:artist,:video_top).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:movie).permit(:text,:instrument,:music,:artist).merge(user_id: current_user.id)
  end



end
