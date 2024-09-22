class UserCoursesController < ApplicationController
  before_action :find_user_course

  def new
    @user_course = UserCourse.new
  end

  def create
    @user_course = UserCourse.new(user_course_params)
    if @user_course.save
      flash[:notice] = "User course created successfully"
      redirect_to user_courses_path
    else
      flash[:error] = "User course creation failed"
      render :new
    end
  end

  def index
    @user_courses = UserCourse.all
  end

  def edit
  end

  def update
    if @user_course.update(user_course_params)
      flash[:notice] = "User course updated successfully"
      redirect_to user_courses_path
    else
      flash[:error] = "User course update failed"
      render :edit
    end
  end

  def destroy
    @user_course.destroy
    flash[:notice] = "User course deleted successfully"
    redirect_to user_courses_path
  end

  def show
  end

  private

  def find_user_course
    @user_course = UserCourse.find(params[:id])
  end

  def user_course_params
    params.require(:user_course).permit(:user_id, :course_id, :progress)
  end
end
