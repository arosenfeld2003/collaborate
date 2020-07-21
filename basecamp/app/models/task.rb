class Task < ApplicationRecord
  validates :title, uniqueness: { scope: :project_id }, presence: true
  belongs_to :project
  has_many :sub_tasks, dependent: :destroy
end
