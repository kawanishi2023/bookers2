class UsersController < ApplicationController
before_action :authenticate_user!, except: [:top]

  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end

  def show
   @user = current_user
   @book = Book.new
   @users =  User.find(params[:id])
   @books = @users.books
  end

  def edit
   @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end
  
  

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  
  
end
