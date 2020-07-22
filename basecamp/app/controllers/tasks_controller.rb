class TasksController < ApplicationController
  before_action :get_project
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @topic.tasks.build
  end

  def index
    @tasks = @project.tasks
  end

  def create
    @task = @project.tasks.build(topic_params)
    @task.completed = false
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project, :anchor =>"tasks")}
      else
        format.html { redirect_to project_path(@project), alert: @task.errors.full_messages[0]  }
      end
    end
  end

  def update
    p @task
    respond_to do |format|
      if params[:completed]
        if @task.update(:completed => !@task.completed)
          format.html { redirect_to project_path(@project, :anchor => "tasks")}
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      else
        if @task.update(:title => params[:title])
          format.html { redirect_to project_path(@project, :anchor => "tasks")}
          format.json { render :show, status: :ok, location: @task }
        end
      end
    end
  end


  private
    def get_project
      @project = Project.find(params[:project_id])
      @project.is_admin = Project.get_role(current_user, @project)
      @project.permissions = Project.get_permissions(current_user, @project)
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def topic_params
      params.require(:task).permit(:title, :completed)
    end
end
