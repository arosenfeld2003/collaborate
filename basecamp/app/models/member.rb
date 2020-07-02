class Member < ApplicationRecord

  validates :email, uniqueness: { scope: :project_id }

  belongs_to :project

  def find_by_email(user)
    projects = Member.where(:email => user.email).map do |elem|
      elem.project.member = elem
      elem.project
    end
    return projects
  end

end
