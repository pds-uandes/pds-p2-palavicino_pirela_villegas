class CoursesController < ApplicationController
  before_action :find_course

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
  end

  def update
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
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :difficulty, :status)
  end
end
