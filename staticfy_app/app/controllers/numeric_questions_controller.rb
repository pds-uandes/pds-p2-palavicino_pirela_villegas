class NumericQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_teacher, only: %i[index]
  before_action :set_numeric_question, only: %i[show show_hint show_result submit_answer]

  def index
  end

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
    @unit_of_measurement = params[:unit_of_measurement].to_s.upcase
    correct_answer = @numeric_question.correct_answer.to_f
    correct_unit = @numeric_question.unit.to_s.upcase

    if (@user_answer - correct_answer).abs <= @numeric_question.tolerance && @unit_of_measurement == correct_unit
      session[:is_correct] = true

      # Aqui se marca como finalizada la tarea con la nueva tabla user_task
      user_task = UserTask.find_or_initialize_by(user_id: current_user.id, task_id: @numeric_question.task_id)
      user_task.is_finished = true
      user_task.save

      # Sumar puntaje para su avance en el Course y global
      numeric_question_course = @numeric_question.task.course
      user_course = UserCourse.find_or_initialize_by(user_id: current_user.id, course_id: numeric_question_course.id)
      user_course.progress += 3
      user_course.save

      user_progress = UserProgress.find_by(user_id: current_user.id)
      user_progress.score += 3
      user_progress.save

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
    elsif @diagram == 'template3'
      set_template3_correct_answer
    elsif @diagram == 'template4'
      set_template4_correct_answer
    elsif @diagram == 'template5'
      set_template5_correct_answer
    elsif @diagram == 'template6'
      set_template6_correct_answer
    elsif @diagram == 'template7'
      set_template7_correct_answer
    elsif @diagram == 'template8'
      set_template8_correct_answer
    elsif @diagram == 'template9'
      set_template9_correct_answer
    elsif @diagram == 'template10'
      set_template10_correct_answer
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

  def set_template3_correct_answer
    @longitud_3 = @parsed_values['longitud'].sample
    @force_magnitude_3 = @parsed_values['forceMagnitude'].sample
    @question_text_3 = @numeric_question.question.gsub('{A}', @force_magnitude_3.to_s).gsub('{B}', @longitud_3.to_s)
    result_3 = @force_magnitude_3 * @longitud_3
    @answer_template3 = result_3.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template3)
  end

  def set_template4_correct_answer
    @longitud_4 = @parsed_values['longitud'].sample
    @force_magnitude_4 = @parsed_values['forceMagnitude'].sample
    @question_text_4 = @numeric_question.question.gsub('{A}', @longitud_4.to_s).gsub('{B}', @force_magnitude_4.to_s)

    result_4 = 0.5 * @longitud_4 * @force_magnitude_4
    @answer_template4 = result_4.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template4)
  end

  def set_template5_correct_answer
    @masa_5 = @parsed_values['masa'].sample
    @angle_5 = @parsed_values['angle'].sample
    @roce_5 = @parsed_values['roce'].sample
    @question_text_5 = @numeric_question.question.gsub('{A}', @masa_5.to_s).gsub('{B}', @angle_5.to_s).gsub('{C}', @roce_5.to_s)
    fN = @masa_5 * 9.8 * Math.cos(@angle_5 * Math::PI / 180)
    fr = @roce_5 * fN
    fwx = @masa_5 * 9.8 * Math.sin(@angle_5 * Math::PI / 180)

    result_5 = fr + fwx
    @answer_template5 = result_5.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template5)
  end

  def set_template6_correct_answer
    @masa_6 = @parsed_values['masa'].sample
    @roce_6 = @parsed_values['roce'].sample
    @roce_polea_6 = @parsed_values['roce_polea'].sample
    @question_text_6 = @numeric_question.question.gsub('{A}', @masa_6.to_s).gsub('{B}', @roce_6.to_s).gsub('{C}', @roce_polea_6.to_s)
    result_6 = @roce_6 * @masa_6 * 9.8 * Math::E**(@roce_polea_6 * Math::PI / 2)
    @answer_template6 = result_6.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template6)
  end

  def set_template7_correct_answer
    @forcePosition_7 = @parsed_values['forcePosition'].sample
    @force_magnitude_7 = @parsed_values['forceMagnitude'].sample
    @length_7 = 10.0 
    
    rb = (@force_magnitude_7 * @forcePosition_7) / @length_7
    ra = @force_magnitude_7 - rb
    
    result_7 = ra 
  
    @question_text_7 = @numeric_question.question.gsub('{A}', @forcePosition_7.to_s).gsub('{B}', @force_magnitude_7.to_s)
    @answer_template7 = result_7.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template7)
  end

  def set_template8_correct_answer
    @longitud_8 = @parsed_values['longitud'].sample
    @force_magnitude_8 = @parsed_values['forceMagnitude'].sample
    @question_text_8 = @numeric_question.question.gsub('{A}', @force_magnitude_8.to_s).gsub('{B}', @longitud_8.to_s)
    @length_8 = 6 

    rb = (@force_magnitude_8 * @longitud_8) /  @length_8
    rc = rb

    result_8 = rc
    @answer_template8 = result_8.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template8)
  end

  def set_template9_correct_answer
    @masa_9 = @parsed_values['masa'].sample
    @question_text_9 = @numeric_question.question.gsub('{A}', @masa_9.to_s)
    result_9 = @masa_9 * 9.8
    @answer_template9 = result_9.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template9)
  end

  def set_template10_correct_answer
    @masa_10 = @parsed_values['masa'].sample
    @angle_10 = @parsed_values['angle'].sample
    @question_text_10 = @numeric_question.question.gsub('{A}', @masa_10.to_s).gsub('{B}', @angle_10.to_s)
    fp = @masa_10 * 9.8
    result_10 = fp * Math.cos(@angle_10 * Math::PI / 180)
    @answer_template10 = result_10.round(2)

    # Actualizar solo si es el diagrama correcto
    @numeric_question.update(correct_answer: @answer_template10)
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

  def authenticate_teacher
    unless current_user.role == 'teacher'
      flash[:alert] = 'No tienes permiso para acceder a esta sección.'
      redirect_to root_path
    end
  end
end
