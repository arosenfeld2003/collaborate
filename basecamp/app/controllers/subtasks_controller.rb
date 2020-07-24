class SubtasksController < ApplicationController
  before_action :get_project
  before_action :get_task
  before_action :set_subtask, only: [:edit, :update, :destroy]

  def new
    @subtask = @task.subtasks.build
  end

  def index
    @subtasks = @task.subtasks
  end

  def create
    @subtask = @task.subtasks.build(subtask_params)
    @subtask.completed = false
    respond_to do |format|
      if @subtask.save
        format.html { redirect_to project_path(@project, :anchor =>"tasks")}
      else
        format.html { redirect_to project_path(@project), alert: @subtask.errors.full_messages[0]  }
      end
    end
  end

  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { redirect_to project_path(@project)}
      else
        format.html { render :edit }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subtask.destroy
    respond_to do |format|
      if params[:path] == 'edit_subtask'
        format.html { redirect_to project_path(@project) }
      else
        format.html { redirect_to edit_task_subtask_path(@project, @task) }
      end
    end
  end


  private

    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    def get_project
      @project = Project.find(params[:project_id])
    end

    def get_task
      @task = Task.find(params[:task_id])
    end

    def subtask_params
      params.require(:subtask).permit(:title, :completed)
    end
end
