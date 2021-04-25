class CommentsController < ApplicationController
  def create
    comment=Comment.create(comment_params)
    redirect_to "/movies/#{comment.movie_id}"
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    @movie=Movie.find(params[:movie_id])
    redirect_to movie_path(@movie)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:memo).merge(user_id: current_user.id,movie_id: params[:movie_id])
  end

end
