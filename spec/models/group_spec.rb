require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Test validations' do
    it 'is invalid when invalid icon url is provided' do
      group = Group.new(name: 'group1', icon_url: 'qwerty')
      expect(group.valid?).to be(false)
    end

    it 'is valid when valid icon url is provided' do
      group = Group.new(name: 'group1',
                        icon_url: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
      expect(group.valid?).to be(true)
    end
  end

  def create_project(nme, hrs, user, grp)
    project = Project.create(
      name: nme,
      hours: hrs,
      user_id: user
    )
    create_grouped_project(project.id, grp)
  end

  def create_grouped_project(p_id, g_id)
    GroupedProject.create(
      project_id: p_id,
      group_id: g_id
    )
  end

  describe 'Test associations' do
    before(:each) do
      User.create(name: 'user1', password: 'password', password_confirmation: 'password')
      Group.create(name: 'group1', icon_url: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
    end

    it 'has many projects' do
      user = User.find_by(name: 'user1')
      group = Group.find_by(name: 'group1')
      create_project('Project 1', 2, user.id, group.id)
      create_project('Project 2', 1, user.id, group.id)
      create_project('Project 3', 4, user.id, group.id)
      expect(group.projects.count).to eql(3)
      expect(group.projects.sum(:hours)).to eql(7)
    end
  end
end
