class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :grouped_projects
  has_many :projects, :through => :grouped_projects
end
