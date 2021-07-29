class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :grouped_projects
  has_many :projects, :through => :grouped_projects

  scope :first_icon_url, -> { order(:created_at).limit(1).pluck(:icon_url) }
end
