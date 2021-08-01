require 'rails_helper'

RSpec.describe 'Feature test' do
  before :each do
    User.create(name: 'user1', password: 'password', password_confirmation: 'password')
  end

  def login_process
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'Name', with: 'user1'
    end
    click_button 'Log in'
  end

  describe 'Sign up process', type: :feature do
    it ' Signs up a user' do
      visit 'users/sign_up'
      within('#new_user') do
        fill_in 'Name', with: 'johndoe'
      end
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
      within('#new_user') do
        fill_in 'Name', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  describe 'log out process', type: :feature do
    it 'successfully logs out' do
      login_process
      click_link 'Sign out'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'create project', type: :feature do
    it 'does not create a project when name is blank' do
      login_process
      within('#new_project') do
        fill_in 'name', with: ''
        click_button 'Submit'
      end
      expect(page).to have_content "Post could not be saved. Content can't be blank"
    end
    it 'creates a project when name is not blank' do
      login_process
      within('#new_project') do
        fill_in 'name', with: 'project1'
        click_button 'Submit'
      end
      expect(page).to have_content 'Post was successfully created.'
    end
  end
end
