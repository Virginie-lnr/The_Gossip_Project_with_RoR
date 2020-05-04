class HomeController < ApplicationController
  def welcome_visitor
    @first_name = params[:first_name]
  end

  def gossip
  end
  
end
