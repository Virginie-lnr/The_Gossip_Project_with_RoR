class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :only_signed_in

  add_flash_types :success, :danger

  helper_method :current_user, :user_signed_in?

  private 

  def only_signed_in
    if !user_signed_in? # si il n'y a PAS d'utilisateur connecté
      redirect_to new_user_path, danger: "You are not allowed to access this page"
    end
  end

  def only_signed_out
    redirect_to profile_path if user_signed_in?
  end

  def user_signed_in?
    !current_user.nil?
  end

  # retourne l'utilisateur actuellement connecté

  def current_user
    return nil if !session[:auth] || !session[:auth]['id']
    return @_user if @_user
    # @user = User.find(session[:auth]['id'])
    @_user = User.find_by_id(session[:auth]['id'])

  end
end
