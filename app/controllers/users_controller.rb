class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    if user_signed_in?
      current_user
    end
  end
end
