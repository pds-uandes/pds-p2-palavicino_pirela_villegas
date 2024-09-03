class NumericQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_numeric_question, only: %i[show show_hint submit_answer]

  def show
    @task = @numeric_question.task
    @numeric_template = @numeric_question.numeric_template

    if @numeric_template&.values.present?
      @parsed_values = JSON.parse(@numeric_template.values)
      template1
      session[:attempts] ||= 0
    else
      flash[:alert] = "No hay Diagramas disponibles"
      redirect_to root_path
    end
  end

  def submit_answer
    @user_answer = params[:user_answer].to_f
    correct_answer = @numeric_question.correct_answer.to_f

    if (@user_answer - correct_answer).abs <= @numeric_question.tolerance
      flash[:notice] = "¡Respuesta correcta! Tu respuesta fue: #{@user_answer}. La respuesta correcta es: #{correct_answer}"
      session[:attempts] = 0
      redirect_to task_path(@numeric_question.task)
    else
      session[:attempts] += 1
      # flash[:reload] = true
      if session[:attempts] < 3
        flash[:alert] = "Respuesta incorrecta. Hint: #{@current_hint}."
        redirect_to show_hint_numeric_question_path(@numeric_question)
      else
        flash[:alert] = "Has agotado los intentos. La respuesta correcta era: #{correct_answer}."
        session[:attempts] = 0
        redirect_to task_path(@numeric_question.task)
      end
    end
  end

  def show_hint
    @current_hint = get_hint(session[:attempts])
  end

  private

  def template1
    @angle = @parsed_values['angle'].sample
    @force_magnitude = @parsed_values['forceMagnitude'].sample

    @question_text = @numeric_question.question.gsub('{A}', @angle.to_s).gsub('{B}', @force_magnitude.to_s)

    va = @force_magnitude * Math.cos(@angle * Math::PI / 180)
    @answer_template1 = va.round(2)

    @numeric_question.update(correct_answer: @answer_template1)
  end

  def get_hint(counter)
    case counter
    when 1
      @numeric_question.hint_1
    when 2
      @numeric_question.hint_2
    when 3
      @numeric_question.hint_3
    else
      "No hay más hints"
    end
  end

  def set_numeric_question
    @numeric_question = NumericQuestion.find(params[:id])
  end

  def numeric_question_params
    params.require(:numeric_question).permit(:task_id, :difficulty, :question, :correct_answer, :tolerance, :unit, :hint_1, :hint_2, :hint_3)
  end
end
