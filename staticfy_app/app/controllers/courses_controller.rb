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
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: 0 })
      when 1..2
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1] })
      when 3..4
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1, 2] })
      when 5
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1, 2, 3] })
      when 6..7
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1, 2, 3, 4, 5] })
      when 7..10
        Course.includes(tasks: :multi_choice_questions).where(id: user_course.course_id).where(tasks: { difficulty: [0, 1, 2, 3, 4, 5] })
      end
    end.flatten
    # Filtrar cursos que no tienen preguntas de opción múltiple
    @courses = @courses.select { |course| course.tasks.any? { |task| task.multi_choice_questions.any? } }
    # Asegurarse de que los cursos están ordenados por dificultad ascendente
    @courses = @courses.sort_by { |course| course.difficulty }
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
