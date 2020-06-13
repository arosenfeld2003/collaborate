class Project < ApplicationRecord

  validates :name, presence: true

  belongs_to :user
  has_many :members, dependent: :destroy

end
