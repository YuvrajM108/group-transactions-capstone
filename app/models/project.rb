class Project < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :grouped_projects
  has_many :groups, :through => :grouped_projects
end
