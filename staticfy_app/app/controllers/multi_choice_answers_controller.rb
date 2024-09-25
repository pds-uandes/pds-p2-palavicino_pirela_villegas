class MultiChoiceAnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @multi_choice_answer = MultiChoiceAnswer.new
  end

  def create
    @multi_choice_answer = MultiChoiceAnswer.new(multi_choice_answer_params)
    @multi_choice_answer.user_id = current_user.id

    if @multi_choice_answer.save
      user_course = UserCourse.find_or_initialize_by(user_id: current_user.id, course_id: @multi_choice_answer.multi_choice_question.task.course.id)
      user_progress = UserProgress.find_by(user_id: current_user.id)

      if @multi_choice_answer.is_correct
        if @multi_choice_answer.multi_choice_question.difficulty == 0
          user_course.progress += 1
          user_progress.score += 1

        elsif @multi_choice_answer.multi_choice_question.difficulty == 1
          user_course.progress += 2
          user_progress.score += 2
        end
        user_course.progress = [user_course.progress, 10].min

      else
        if @multi_choice_answer.multi_choice_question.difficulty == 0
          user_course.progress -= 1
          user_progress.score -= 1

        elsif @multi_choice_answer.multi_choice_question.difficulty == 1
          user_course.progress -= 2
          user_progress.score -= 2
        end
        user_course.progress = [user_course.progress, 0].max
        user_progress.score = [user_progress.score, 0].max


      end
      user_course.save
      user_progress.save

      render json: { success: true }, status: :created
    else
      render json: { errors: @multi_choice_answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    if params[:course_id]
      @multi_choice_answers_filtered = MultiChoiceAnswer.joins(multi_choice_question: { task: :course })
                                                        .where(courses: { id: params[:course_id] })
    else
      @multi_choice_answers = MultiChoiceAnswer.all
    end
  end


  def edit
    if current_multi_choice_answer.id == params[:id]
      @multi_choice_answer = MultiChoiceAnswer.find(params[:id])
    else
      flash[:notice] = "You can only edit yourself."
      redirect_to multiChoiceAnswers_path
    end
  end

  def update
    @multi_choice_answer = MultiChoiceAnswer.find(params[:id])

    if current_multi_choice_answer.id == @multi_choice_answer.id
      if @multi_choice_answer.update multi_choice_answer_params
        flash[:notice] = "Multi_choice_answer updated successfully"
        redirect_to multiChoiceAnswers_path
      else
        render :edit
        flash[:error] = "Multi_choice_answer update failed"
      end
    else
      flash[:notice] = "You can only edit yourself."
      redirect_to multiChoiceAnswers_path
    end
  end

  def destroy
    @multi_choice_answer = MultiChoiceAnswer.find(params[:id])

    if current_multi_choice_answer.id == @multi_choice_answer.id
      @multi_choice_answer.destroy
      flash[:notice] = "Multi_choice_answer deleted successfully"
      redirect_to multiChoiceAnswers_path
    else
      flash[:notice] = "You can only destroy yourself."
      redirect_to multiChoiceAnswers_path
    end
  end

  def show
    @multi_choice_answer = MultiChoiceAnswer.find(params[:id])
  end

  private

  def multi_choice_answer_params
    params.require(:multi_choice_answer).permit(:user_id, :multi_choice_question_id, :selected_choice, :is_correct)
  end
end
