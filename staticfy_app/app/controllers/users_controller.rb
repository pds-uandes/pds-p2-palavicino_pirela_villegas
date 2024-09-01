class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      render :new
      flash[:error] = "User creation failed"
    end
  end

  def index
    @users = User.all
  end

  def edit
    if current_user.id == params[:id]
      @user = User.find(params[:id])
    else
      flash[:notice] = "You can only edit yourself."
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.id == @user.id
      if @user.update user_params
        flash[:notice] = "User updated successfully"
        redirect_to users_path
      else
        render :edit
        flash[:error] = "User update failed"
      end
    else
      flash[:notice] = "You can only edit yourself."
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    if current_user.id == @user.id
      @user.destroy
      flash[:notice] = "User deleted successfully"
      redirect_to users_path
    else
      flash[:notice] = "You can only destroy yourself."
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
