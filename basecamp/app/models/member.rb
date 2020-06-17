class Member < ApplicationRecord

  validates :email, uniqueness: { scope: :project_id }

  belongs_to :project

end
