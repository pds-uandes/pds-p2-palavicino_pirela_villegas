class UserTasksController < ApplicationController
  def new
    @user_task = UserTask.new
  end

  def create
    @user_task = UserTask.new(user_task_params)
    if @user_task.save
      flash[:notice] = "User task created successfully"
      redirect_to user_tasks_path
    else
      flash[:error] = "User task creation failed"
      render :new
    end
  end

  def index
    @user_tasks = UserTask.all
  end

  def edit
    @user_task = UserTask.find(params[:id])
  end

  def update
    @user_task = UserTask.find(params[:id])

    if @user_task.update(user_task_params)
      flash[:notice] = "User task updated successfully"
      redirect_to user_tasks_path
    else
      flash[:error] = "User task update failed"
      render :edit
    end
  end

  def destroy
    @user_task = UserTask.find(params[:id])

    @user_task.destroy
    flash[:notice] = "User task deleted successfully"
    redirect_to user_tasks_path
  end

  def show
    @user_task = UserTask.find(params[:id])
  end

  private

  def user_task_params
    params.require(:user_task).permit(:user_id, :task_id, :is_finished)
  end
end
