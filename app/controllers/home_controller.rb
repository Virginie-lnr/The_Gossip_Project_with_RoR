class HomeController < ApplicationController
  def show
    @gossips = Gossip.all
    # @first_name = params[:first_name]
    # @gossip = Gossip.find(params[:id])
    # @user = User.find(params[:id])
  end
end
