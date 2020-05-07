class UsersController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create, :confirm]
  before_action :only_signed_out, only: [:new, :create, :confirm]

  def show
    id = params[:id].to_i  
    @user = User.find_by id: id 
  end

  def new
    @user = User.new
  end

  def create    
    user_params = params.require(:user).permit(:username, :first_name, :last_name, :email, :city_id, :password, :password_confirmation)
     @user = User.new(user_params)
     @user.city = City.all.find_by(id: params[:city])
  
     if @user.valid?
      @user.save
      redirect_to root_path, success: 'Your account have been created with success! 🎉'
     else 
      render 'new'
     end
  end

  def confirm 
    @user = User.find(params[:id])
    if @user.confirmation_token == params[:token]
      @user.update_attributes(confirmed: true, confirmation_token: nil)
      @user.save(validate: false )
      session[:auth] = @user.to_session
      redirect_to profile_path, success: 'Your account has been confirmed! 🤩'
    else 
      redirect_to new_user_path, danger: 'This token is not valid'
    end
  end

  def edit
    # @user = User.find(session[:auth]['id'])
    @user = current_user
  end

  def update
  end

  def destroy
  end

  def index
  end
end
