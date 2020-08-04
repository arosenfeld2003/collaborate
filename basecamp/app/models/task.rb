class Task < ApplicationRecord
  attr_accessor :last_edit_email, :last_edit_name
  belongs_to :project

  validates :title, presence: true
  has_many :subtasks, class_name: "Task",
                      foreign_key: "parent_id"
  belongs_to :parent, class_name: "Task", optional: true
end
