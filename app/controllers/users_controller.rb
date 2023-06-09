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
    if current_user.id == @user.id
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
