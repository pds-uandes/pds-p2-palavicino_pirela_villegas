class UserProgressesController < ApplicationController
  before_action :authenticate_user!

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
    @user_courses = UserCourse.select('DISTINCT ON (user_id, course_id) *').includes(:course, :user).order(:user_id, :course_id)

    # Pregunta de alternativa con mayor tasa de error
    @most_wrong_question = MultiChoiceAnswer
    .joins(multi_choice_question: { task: :course })
    .group('multi_choice_questions.id, multi_choice_questions.question, courses.name')
    .select('multi_choice_questions.id, multi_choice_questions.question, courses.name as course_name, COUNT(*) as wrong_count')
    .where(is_correct: false)
    .order('wrong_count DESC')
    .limit(1)
    .first


    # Pregunta de alternativa con menor tasa de error
    @least_wrong_question = MultiChoiceAnswer
    .joins(multi_choice_question: { task: :course })
    .group('multi_choice_questions.id, multi_choice_questions.question, courses.name')
    .select('multi_choice_questions.id, multi_choice_questions.question, courses.name as course_name, COUNT(*) as correct_count')
    .where(is_correct: true)
    .order('correct_count ASC')
    .limit(1)
    .first


    # Curso con mayor puntaje promedio
    @highest_average_score_course = UserCourse
      .joins(:course)
      .group('courses.id, courses.name')
      .select('courses.id, courses.name, SUM(user_courses.progress) as avg_score')
      .order('avg_score DESC')
      .limit(1)
      .first

    # Curso con menor puntaje promedio
    @lowest_average_score_course = UserCourse
      .joins(:course)
      .group('courses.id, courses.name')
      .select('courses.id, courses.name, AVG(user_courses.progress) as avg_score')
      .order('avg_score ASC')
      .limit(1)
      .first
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
    @course1 = Course.where(name: 'Diagramas de Cuerpo Libre').first
    @course2 = Course.where(name: 'Vínculos Externos e Internos').first
    @course3 = Course.where(name: 'Condiciones de Equilibrio y Estabilidad').first
    @course4 = Course.where(name: 'Tipos de fuerzas más comunes').first
    @course5 = Course.where(name: 'Rozamiento y Poleas').first

    @user_id = params[:id]

    @user_progress_global = UserProgress.where(user_id: params[:id]).first

    @user_progress_course1 = UserCourse.find_by(user_id: params[:id], course_id: @course1.id)
    @user_progress_course2 = UserCourse.find_by(user_id: params[:id], course_id: @course2.id)
    @user_progress_course3 = UserCourse.find_by(user_id: params[:id], course_id: @course3.id)
    @user_progress_course4 = UserCourse.find_by(user_id: params[:id], course_id: @course4.id)
    @user_progress_course5 = UserCourse.find_by(user_id: params[:id], course_id: @course5.id)

    @user = @user_progress_global.user
  end

  private

  def user_progress_params
    params.require(:user_progress).permit(:user_id, :score)
  end
end
