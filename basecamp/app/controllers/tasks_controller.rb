class TasksController < ApplicationController
  before_action :get_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = @project.task.build
  end

  def index
    @tasks = @project.tasks
  end

  def create
    @task = @project.tasks.build(task_params)
    
  end

  def update
  end

  def destroy
  end

  def show
  end

  def edit
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def get_project
      @project = Project.find(params[:project_id])
      @project.is_admin = Project.role(current_user, @project)
    end

    def task_params
      params.require(:task).permit(:title)
    end

end
