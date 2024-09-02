class NumericQuestionsController < ApplicationController
  def show
    @numeric_question = NumericQuestion.find(params[:id])
    @task = @numeric_question.task
    @numeric_template = @numeric_question.numeric_template


    parsed_values = JSON.parse(@numeric_template.values)
    @angle = parsed_values['angle'].sample
    @force_magnitude = parsed_values['forceMagnitude'].sample
    @question_text = @numeric_question.question.gsub('{A}', @angle.to_s).sub('{B}', @force_magnitude.to_s)
  end
end
