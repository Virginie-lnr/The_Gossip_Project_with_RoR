class GossipsController < ApplicationController
  def new
  end

  def show  
    id = params[:id].to_i  
    @gossip = Gossip.find_by id: id  
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
    redirect_to gossips_path
    else
      render :edit
    end
  end

  def create
    @gossip = Gossip.new(title: params[:title],
    content: params[:content],
    user: User.find(session[:auth]['id']))
    # User.find(params[:user])
    if @gossip.save
    redirect_to root_path
    else 
      render 'new'
    end
    
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def index 
  end

private


end
