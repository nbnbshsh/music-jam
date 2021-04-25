class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user=user
    @movies = user.movies.order(created_at: :desc)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      redirect_to "/users/#{current_user.id}/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:nickname,:instrument,:prefecture_id,:history_id,:gender_id,:age,:genre,:artist)
  end

end
