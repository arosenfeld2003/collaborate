class TopicsController < ApplicationController
  before_action :get_project

  def new
    @topic = @project.topics.build
  end

  def index
    @topics = @project.topics
  end

  def show
  end

  # GET /members/1/edit -> projects/project_id/members/1/edit
  def edit
  end

  def create
    @topic = @project.topics.build(topic_params)
    @topic.author = current_user.name
    respond_to do |format|
      if @topic.save
        format.html { redirect_to project_path(@project)}
      else
        format.html { redirect_to project_path(@project), notice: @topic.errors.full_messages[0]  }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(:is_admin => !@member.is_admin)
        format.html { redirect_to edit_project_path(@project)}
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to show_project_path(@project) }
      format.json { head :no_content }
    end
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
