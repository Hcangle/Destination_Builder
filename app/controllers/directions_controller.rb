class DirectionsController < ApplicationController

    def index 
      get_route
    
    end 

    def new 
        get_route 
        @direction = Direction.new
    
    end 

    def create 
    @route = Route.find_by(id: params[:direction][:route_id])
    @direction = Direction.new(direction_params)
    if @direction.save 
     redirect_to route_direction_path(@direction.route[:id])
    else 
        render :new
    end 
end 


    private 

    def get_route
        @route ||= Route.find_by(id: params[:route_id])
    end 

    def direction_params
        params.require(:direction).permit(:destination_id, :duration, :variation, :route_id)

    end 

end 