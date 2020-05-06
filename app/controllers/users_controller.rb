class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def show
    id = params[:id].to_i  
    @user = User.find_by id: id 
  end

  def update
  end

  def destroy
  end

  def index
  end
end
