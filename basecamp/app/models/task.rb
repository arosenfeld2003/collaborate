class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  has_many :subtasks, dependent: :destroy
end
