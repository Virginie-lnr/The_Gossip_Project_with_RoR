class GossipsController < ApplicationController
  def new
  end

  def edit
  end


  def show  
    id = params[:id].to_i  
    @gossip = Gossip.find_by id: id  
  end

  def create
    @gossip = Gossip.new(title: params[:title],
    content: params[:content],
    user: User.find(params[:user]))
    # user: User.find_by(id: 8))
    @gossip.save
    redirect_to root_path
    
  end

    # user: User.find(params[:user]))
# @gossip = Gossip.new(params[:post])
    # if @gossip.save
    # redirect_to gossips_path
    # else
    # render 'new'
    # end



  def update
  end

  def destroy
  end

  def index
   
  end
end
