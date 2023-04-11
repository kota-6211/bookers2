class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @userss = current_user
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
     @user.update(user_params)
     redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
