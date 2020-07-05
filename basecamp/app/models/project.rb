class Project < ApplicationRecord
  attr_accessor :member, :is_owner, :is_admin, :css_class, :owner
  validates :name, presence: true


  belongs_to :user
  has_many :members, dependent: :destroy

  def self.find_by_owner(current_user)
    result = where(:user => current_user)

    if result.length > 0
      result.each do |elem|
        elem.is_admin = true
        elem.is_owner = true
        elem.owner = current_user.name
        elem.css_class = "owner"
      end
    end
    return result
  end
end
