require 'rails_helper'
require 'devise'

Rspec.describe Project, type: :model do
  before(:each) do
    User.create(name: 'user1', password: 'password', password_confirmation: 'password')
  end
  describe 'Project validations' do
    it 'cannot be empty' do
      user = User.find_by(name: 'user1')
      project = user.projects.build
      expect(projects.valid?).to be(false)
    end
  end
end
