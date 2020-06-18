class Project < ApplicationRecord
  attr_accessor :member, :is_owner
  validates :name, presence: true

  belongs_to :user
  has_many :members, dependent: :destroy

end
