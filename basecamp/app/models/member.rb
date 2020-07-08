class Member < ApplicationRecord

  validates :email, uniqueness: { scope: :project_id }, presence: true

  belongs_to :project

  def self.find_by_email(user)
    projects = Member.where(:email => user.email).map do |elem|
      elem.project.member = elem
      elem.project.css_class = "member"
      elem.project.owner = elem.project.user.name
      elem.project.is_owner = false
      elem.project.is_admin = elem.is_admin
      elem.project.num_members = elem.project.members.count
      elem.project.num_topics = elem.project.topics.count
      elem.project
    end
    return projects
  end

end
