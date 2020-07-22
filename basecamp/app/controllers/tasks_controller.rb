class TasksController < ApplicationController
  before_action :get_project



  private
    def get_project
      @project = Project.find(params[:project_id])
      @project.is_admin = Project.get_role(current_user, @project)
      @project.permissions = Project.get_permissions(current_user, @project)
    end

end
