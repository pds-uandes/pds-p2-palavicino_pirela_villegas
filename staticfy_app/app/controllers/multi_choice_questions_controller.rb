class MultiChoiceQuestionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_multi_choice_question, only: %i[show edit update destroy]

    def index
      @multi_choice_questions = MultiChoiceQuestion.all
    end

    def show
        @multi_choice_question = MultiChoiceQuestion.find(params[:id])
    end

    def new
      @multi_choice_question = MultiChoiceQuestion.new
    end

    def edit
    end

    def create
      choices = {}
      (1..4).each do |i|
        value = params["multi_choice_question"]["choice_#{i}_value"]
        why_not = params["multi_choice_question"]["choice_#{i}_why_not"]
        choices["choice_#{i}"] = { value: value, why_not: why_not }
      end

      @multi_choice_question = MultiChoiceQuestion.new(
        task_id: params[:multi_choice_question][:task_id],
        difficulty: params[:multi_choice_question][:difficulty],
        question: params[:multi_choice_question][:question],
        choice_1: choices["choice_1"].to_json,
        choice_2: choices["choice_2"].to_json,
        choice_3: choices["choice_3"].to_json,
        choice_4: choices["choice_4"].to_json,
        correct_answer: params[:multi_choice_question][:correct_answer]
      )

      if @multi_choice_question.save
          flash[:notice] = 'Pregunta creada correctamente'
      else
          flash[:alert] = 'Ocurrió un error al crear la pregunta'
      end
        redirect_to root_path
    end


    def update
      respond_to do |format|
        if @multi_choice_question.update(multi_choice_question_params)
          format.html { redirect_to @multi_choice_question, notice: 'Multi choice question was successfully updated.' }
          format.json { render :show, status: :ok, location: @multi_choice_question }
        else
          flash.now[:error] = 'Multi choice question update failed'
          format.html { render :edit }
          format.json { render json: @multi_choice_question.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @multi_choice_question.destroy
      respond_to do |format|
        format.html { redirect_to multi_choice_questions_url, notice: 'Multi choice question was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def submit_answer
        @multi_choice_question = MultiChoiceQuestion.find(params[:id])
        selected_answer = params[:selected_answer]

        # Aquí puedes manejar la lógica de guardar la respuesta, validar si es correcta, etc.
        if selected_answer == @multi_choice_question.correct_answer
          flash[:notice] = 'Correct Answer!'
        else
          flash[:alert] = 'Incorrect Answer.'
        end

        redirect_to @multi_choice_question
    end


    private

      def set_multi_choice_question
        @multi_choice_question = MultiChoiceQuestion.find(params[:id])
      end

      def multi_choice_question_params
        params.require(:multi_choice_question).permit(:task_id, :difficulty, :question, :choice_1, :choice_2, :choice_3, :choice_4, :correct_answer)
      end
end
