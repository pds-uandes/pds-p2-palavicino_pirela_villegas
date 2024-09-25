class TasksController < ApplicationController
    before_action :set_task, only: %i[show edit update destroy]
    before_action :authenticate_user!

    # GET /tasks
    # GET /tasks.json
    def index
      @tasks = Task.all

      # Para que en el Home funcionen los botones ->
      # La idea es que el index cambie dependiendo si se quieren tareas pendientes (status 'in_progress')
      # y de alternativas (task_type 'multi_choice') o numericas (task_type 'multi_choice')
      if params[:status].present?
        @tasks = @tasks.where(status: params[:status])
      end

      if params[:task_type].present?
        @tasks = @tasks.where(task_type: params[:task_type])
      end
    end

    def submit_answer
      selected_choice = params[:selected_choice]
      question_id = params[:multi_choice_question_id]
      task_id = params[:task_id]
      correct_answer = MultiChoiceQuestion.find(question_id).correct_answer

      is_correct = (selected_choice == correct_answer)

      MultiChoiceAnswer.create!(
        user_id: current_user.id,
        multi_choice_question_id: question_id,
        selected_choice: selected_choice,
        is_correct: is_correct
      )

    end

    def finish
      task = Task.find(params[:id])
      user_task = UserTask.find_or_initialize_by(user_id: current_user.id, task_id: task.id)
      user_task.is_finished = true
      user_task.save

      redirect_to courses_path, notice: 'Se ha creado una nueva tarea con las preguntas incorrectas.'
    end

    def retry_incorrect
      @task = Task.find(params[:id])

      # Recuperar preguntas incorrectamente respondidas
      incorrect_question_ids = MultiChoiceAnswer.where(user_id: current_user.id, is_correct: false, multi_choice_question_id: @task.multi_choice_questions.ids).pluck(:multi_choice_question_id)
      @multi_choice_questions = MultiChoiceQuestion.where(id: incorrect_question_ids)

      @questions_with_choices = @multi_choice_questions.each_with_object({}) do |question, hash|
        hash[question.id] = {
          choice1: JSON.parse(question.choice_1),
          choice2: JSON.parse(question.choice_2),
          choice3: JSON.parse(question.choice_3),
          choice4: JSON.parse(question.choice_4)
        }
      end

      render :show
    end

    def create_incorrect
      original_task = Task.find(params[:id])
      # Recuperar preguntas incorrectamente respondidas
      incorrect_question_ids = MultiChoiceAnswer.where(user_id: current_user.id, is_correct: false, multi_choice_question_id: original_task.multi_choice_questions.ids).pluck(:multi_choice_question_id)

      # Crear una nueva tarea
      new_task = Task.create!(
        user_id: current_user.id,
        task_type: 'multi_choice',
        status: 'in_progress',
        name: "Repetición de Tarea ##{original_task.id}",
        is_finished: false,
        course_id: original_task.course_id
      )

      # Asociar las preguntas incorrectas a la nueva tarea
      incorrect_question_ids.each do |question_id|
        MultiChoiceQuestion.find(question_id).update!(task_id: new_task.id)
      end

      redirect_to courses_path, 'Se ha creado una nueva tarea con las preguntas incorrectas.'
    end


    # GET /tasks/1
    # GET /tasks/1.json
    def show
      @task = Task.find(params[:id])

      if @task.task_type == 'multi_choice'
        @multi_choice_questions = MultiChoiceQuestion.where(task_id: @task.id)
        @multi_choice_questions_len = @multi_choice_questions.size

        @questions_with_choices = {}

        # Parsear las alternativas de cada pregunta
        @multi_choice_questions.each do |question|
          @questions_with_choices[question.id] = {
            choice1: JSON.parse(question.choice_1),
            choice2: JSON.parse(question.choice_2),
            choice3: JSON.parse(question.choice_3),
            choice4: JSON.parse(question.choice_4)
          }
        end
      else
        @multi_choice_questions = []
      end
    end

    # GET /tasks/new
    def new
      @task = Task.new
    end

    # GET /tasks/1/edit
    def edit
    end

    # POST /tasks
    # POST /tasks.json
    def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id

      respond_to do |format|
        if @task.save
          format.html { redirect_to tasks_path, notice: 'La tarea fue creada correctamente.' }
          format.json { render :show, status: :created, location: @task }
        end
      end
    end


    # PATCH/PUT /tasks/1
    # PATCH/PUT /tasks/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to tasks_path, notice: 'La tarea fue actualizada correctamente.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tasks/1
    # DELETE /tasks/1.json
    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:user_id, :task_type, :status, :name, :is_finished, :course_id)
      end
end
