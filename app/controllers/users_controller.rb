class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end

  def show
    
  end
end
