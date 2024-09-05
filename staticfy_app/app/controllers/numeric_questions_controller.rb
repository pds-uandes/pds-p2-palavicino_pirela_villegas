class NumericQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_numeric_question, only: %i[show show_hint show_result submit_answer]

  def show
    @task = @numeric_question.task
    @numeric_template = @numeric_question.numeric_template

    if @numeric_template
      @diagram = @numeric_template.diagram_data

      if @numeric_template.values.present?
        @parsed_values = JSON.parse(@numeric_template.values)
        calculate_correct_answer
        session[:attempts] ||= 0
      else
        flash[:alert] = "No hay Diagramas disponibles"
        redirect_to root_path
      end
    else
      flash[:alert] = "No se encontró una plantilla numérica para esta pregunta."
      redirect_to root_path
    end
  end

  def submit_answer
    @user_answer = params[:user_answer].to_f
    correct_answer = @numeric_question.correct_answer.to_f

    if (@user_answer - correct_answer).abs <= @numeric_question.tolerance
      session[:is_correct] = true
      # @numeric_question.task.update(is_finished: true)
      flash[:notice] = "¡Respuesta correcta! Tu respuesta fue: #{@user_answer}. La respuesta correcta es: #{correct_answer}"
      session[:attempts] = 0
      redirect_to show_result_numeric_question_path(@numeric_question)
    else
      session[:is_correct] = false
      session[:attempts] += 1
      if session[:attempts] <= 3
        flash[:alert] = "Respuesta incorrecta."
        redirect_to show_hint_numeric_question_path(@numeric_question)
      else
        flash[:alert] = "Has agotado los hints!"
        session[:attempts] = 0
        redirect_to show_result_numeric_question_path(@numeric_question)
      end
    end
  end

  def show_hint
    @current_hint = get_hint(session[:attempts])
  end

  def show_result
    @is_correct = session.delete(:is_correct)
  end

  private

  def calculate_correct_answer
    if @diagram == 'template1'
      set_template1_correct_answer
    elsif @diagram == 'template2'
      set_template2_correct_answer
    end
  end

  def set_template1_correct_answer
    @angle_1 = @parsed_values['angle'].sample
    @force_magnitude_1 = @parsed_values['forceMagnitude'].sample
    @question_text_1 = @numeric_question.question.gsub('{A}', @angle_1.to_s).gsub('{B}', @force_magnitude_1.to_s)
    result_1 = @force_magnitude_1 * Math.cos(@angle_1 * Math::PI / 180)
    @answer_template1 = result_1.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template1)
  end

  def set_template2_correct_answer
    @angle_2 = @parsed_values['angle'].sample
    @force_magnitude_2 = @parsed_values['forceMagnitude'].sample
    @question_text_2 = @numeric_question.question.gsub('{A}', @angle_2.to_s).gsub('{B}', @force_magnitude_2.to_s)
    result_2 = @force_magnitude_2 * Math.cos(@angle_2 * Math::PI / 180)
    @answer_template2 = result_2.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template2)
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
