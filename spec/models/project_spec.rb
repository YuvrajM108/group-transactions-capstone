require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    User.create(name: 'user1', password: 'password', password_confirmation: 'password')
  end

  describe 'Project validations' do
    it 'cannot be empty' do
      user = User.find_by(name: 'user1')
      project = user.projects.build
      expect(project.valid?).to be(false)
    end
  end
end
