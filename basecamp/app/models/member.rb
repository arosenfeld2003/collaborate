class Member < ApplicationRecord

  validates :email, uniqueness: { scope: :project_id }

  belongs_to :project

  def find_by_email(user)
    projects = Member.where(:email => user.email).map do |elem|
      elem.project.member = elem
      elem.project.class = "member"
      elem.project.owner = elem.project.user.name
      elem.project.is_owner = false
      elem.project.is_admin = elem.is_admin
      elem.project
    end
    return projects
  end

end
