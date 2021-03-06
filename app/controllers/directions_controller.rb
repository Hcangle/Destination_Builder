class DirectionsController < ApplicationController
    before_action :require_login
    before_action :get_route, only: [:index, :new]

    def index 
      redirect_if_request_invalid
    end 

    def new 
        @route = Route.find_by_id(params[:route_id])
        @direction = @route.directions.build
    
    end 

    def create 
       @route = Route.find_by(id: params[:direction][:route_id])
        if user_authorized?
        
         @direction = Direction.new(direction_params)
         @direction.destination_id = params[:direction][:id]
         
          if @direction.save 
           redirect_to route_direction_path(@direction.route_id, @direction )
          else  
           render :new
          end 
        else 
        # redirect_to routes_path
     end 
    end 
    
    
def show 
    @direction = Direction.find_by(params[:id])
     render :show
end 

def destroy
end 


    private 

    def get_route
        @route ||= Route.find_by(id: params[:route_id])
    end 

    def user_authorized?
       @route.user && (@route.user.id == current_user.id)
    end 

    def redirect_if_request_invalid
        if @route.nil? || user_authorized?
            redirect_to routes_path
        end 
    end 

    def direction_params
        params.require(:direction).permit(:destination_id, :duration, :variation, :route_id)

    end 

end 