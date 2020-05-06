class CitiesController < ApplicationController
  def show
    id = params[:id].to_i  
    @city = City.find_by(id: id)
  end
end
