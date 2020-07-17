class Project < ApplicationRecord
  attr_accessor :member, :is_owner, :is_admin, :css_class, :owner, :num_members, :num_topics
  validates :name, presence: true


  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many_attached :attachments, dependent: :destroy

  def self.role(current_user, project)
    if project.user == current_user
      return true
    end
    return Member.where(:email => current_user.email, :project => project)[0].is_admin
  end

  def self.owner(current_user, project)
    return (project.user == current_user)
  end

  def self.membership(current_user, project)
    return Member.where(:email => current_user.email, :project => project)[0]
  end

  def self.find_by_owner(current_user)
    result = where(:user => current_user)

    if result.length > 0
      result.each do |elem|
        elem.is_admin = true
        elem.is_owner = true
        elem.owner = current_user.name
        elem.css_class = "owner"
        elem.num_members = elem.members.count
        elem.num_topics = elem.topics.count
      end
    end
    return result
  end
end