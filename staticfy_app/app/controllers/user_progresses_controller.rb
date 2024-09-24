class UserProgressesController < ApplicationController
  def new
    @user_progress = UserProgress.new
  end

  def create
    @user_progress = UserProgress.new(user_progress_params)
    if @user_progress.save
      flash[:notice] = "User progress created successfully"
      redirect_to user_progresses_path
    else
      flash[:error] = "User progress creation failed"
      render :new
    end
  end

  def index
    @user_progresses = UserProgress.select(:user_id, :score).distinct.includes(:user)
    @user_courses = UserCourse.select('DISTINCT user_courses.*').includes(:course, :user)
  end

  def edit
    @user_progress = UserProgress.find(params[:id])
  end

  def update
    @user_progress = UserProgress.find(params[:id])

    if @user_progress.update(user_progress_params)
      flash[:notice] = "User progress updated successfully"
      redirect_to user_progresses_path
    else
      flash[:error] = "User progress update failed"
      render :edit
    end
  end

  def destroy
    @user_progress = UserProgress.find(params[:id])

    @user_progress.destroy
    flash[:notice] = "User progress deleted successfully"
    redirect_to user_progresses_path
  end

  def show
    @user_progress = UserProgress.find_by(user_id: params[:id])
    @user = @user_progress.user
  end

  private

  def user_progress_params
    params.require(:user_progress).permit(:user_id, :score)
  end
end
