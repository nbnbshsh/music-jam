class UsersController < ApplicationController
before_action :edit_user,only: [:edit,:update]

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

  def edit_user
    @user=User.find(params[:id])
    if user_signed_in? && current_user.id != @user.id
      redirect_to root_path
    end
  end

end
