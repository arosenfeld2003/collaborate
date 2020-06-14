class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

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
end
