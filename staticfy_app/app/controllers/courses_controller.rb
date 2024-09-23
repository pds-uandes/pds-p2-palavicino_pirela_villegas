class CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course created successfully"
      redirect_to courses_path
    else
      flash[:error] = "Course creation failed"
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Course updated successfully"
      redirect_to courses_path
    else
      flash[:error] = "Course update failed"
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Course deleted successfully"
    redirect_to courses_path
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :difficulty, :status, :description)
  end
end
