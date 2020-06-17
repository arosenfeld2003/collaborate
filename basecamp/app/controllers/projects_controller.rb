class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def getProjectsByMember(projects)
    projectsArray = []
    projects.each do |project|
      project.members.each do |member|
        if member.email == current_user.email
          projectsArray.push(project)
        end
      end
    end
    return projectsArray
  end

  def concatProjects(array1, array2)
    projectsAll = array1.concat(array2)

    return projectsAll
  end

  def index
    if user_signed_in?
      @projectsAll = Project.all
      @projectsByOwner = Project.where("user_id=?", current_user.id)
      @projectsByMember = getProjectsByMember(@projectsAll)
      @projects = concatProjects(@projectsByOwner.to_a, @projectsByMember.to_a)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @members = Member.where("project_id=?", params[:id])
    if @members
      @members.each do |member|
        if member.email == current_user.email
          @activeMember = member
        end
      end
    end
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :member_id)
    end
end
