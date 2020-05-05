class GossipController < ApplicationController
  def show    
    id = params[:format].to_i  
    @gossip = Gossip.find_by id: id    
  end
end
