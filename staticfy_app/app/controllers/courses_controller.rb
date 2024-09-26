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
    user_courses = UserCourse.where(user_id: current_user.id)


    @courses = user_courses.map do |user_course|
      case user_course.progress
      when 0
        # Si el progreso es 0, mostrar solo tareas con dificultad 0
        Course.includes(:tasks).where(id: user_course.course_id).where(tasks: { difficulty: 0 })
      when 1..3
        # Si el progreso es entre 1 y 3, mostrar tareas con dificultad 0 o 1
        Course.includes(:tasks).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1] })
      else
        # Si el progreso es mayor a 3, mostrar tareas con dificultad 1 o 2
        Course.includes(:tasks).where(id: user_course.course_id).where(tasks: { difficulty: [1, 2] })
      end
    end.flatten
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
