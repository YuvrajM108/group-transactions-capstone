class Project < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :grouped_projects
  has_many :groups, through: :grouped_projects

  scope :without_groups, lambda {
                           where('NOT EXISTS(SELECT 1 FROM grouped_projects
                            WHERE project_id = projects.id)')
                         }
end
