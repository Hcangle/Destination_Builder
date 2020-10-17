class DirectionsController < ApplicationController

    def index 
      grab_route
      validate_route

    end 

    def new 
    
    end 

    def create 
    @route = Route.find_by(id: params[:direction][:route_id])
    @direction = Direction.new(direction_params)
    if direction.save 
        redirect_to route_directions_path
    else 
        render :new 
    end 
    end 

    private 

    def direction_params
        
    end 

end 