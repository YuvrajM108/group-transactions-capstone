class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    current_user if user_signed_in?
  end
end
