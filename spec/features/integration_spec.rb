require 'rails_helper'

RSpec.describe 'Feature test' do
  before :each do
    User.create(name: 'user1', password: 'password', password_confirmation: 'password')
  end

  def login_process
    visit 'users/sign_in'
    fill_in 'name', with: 'user1'
    click_button 'Log in'
  end

  describe 'Sign up process', type: :feature do
    it ' Signs up a user' do
      visit 'users/sign_up'
      fill_in 'name', with: 'johndoe'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    it 'Fails to sign up with empty form' do
      visit 'users/sign_up'

      click_button 'Sign up'
      expect(page).to have_content "Name can't be blank"
    end
  end

  describe 'log in process', type: :feature do
    it 'logs in' do
      login_process
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'fails to log in with empty fields' do
      visit 'users/sign_in'
      fill_in 'name', with: ''
      click_button 'Log in'
      expect(page).to have_content 'Invalid Name or password.'
    end
  end

  describe 'log out process', type: :feature do
    it 'successfully logs out' do
      login_process
      click_link 'logout'
      expect(page).to have_content 'Signed out successfully.'
    end
  end

  describe 'create project', type: :feature do
    it 'does not create a project when name is blank' do
      login_process
      visit 'projects/new'
      fill_in 'name', with: ''
      fill_in 'hours', with: '2'
      click_button 'Submit'
      expect(page).to have_content "Name can't be blank"
    end
    it 'creates a project when name is not blank' do
      login_process
      visit 'projects/new'
      fill_in 'name', with: 'project1'
      fill_in 'hours', with: '2'
      click_button 'Submit'
      expect(page).to have_content 'Project was successfully created.'
    end
  end
end
