class MultiChoiceAnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @multi_choice_answer = MultiChoiceAnswer.new
  end

  def create
    @multi_choice_answer = MultiChoiceAnswer.new(multi_choice_answer_params)
    if @multi_choice_answer.save!
      flash[:notice] = "MultiChoiceAnswer created successfully"
      redirect_to root_path
    else
      render :new
      flash[:error] = "MultiChoiceAnswer creation failed"
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
