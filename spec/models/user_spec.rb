require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test validations' do
    it 'is invalid when there is no name' do
      user = User.new
      expect(user.valid?).to be(false)
    end
  end

  def create_project(nme, hrs, user)
    Project.create(
      name: nme,
      hours: hrs,
      user_id: user
    )
  end

  describe 'Test associations' do
    before(:each) do
      User.create(name: 'user1', password: 'password', password_confirmation: 'password')
    end

    it 'has many projects' do
      user = User.find_by(name: 'user1')
      create_project('Project 1', 2, user.id)
      create_project('Project 2', 1, user.id)
      create_project('Project 3', 4, user.id)
      expect(user.projects.count).to eql(3)
      expect(user.projects.sum(:hours)).to eql(7)
    end
  end
end
