class RoutesController < ApplicationController

    def index 
        @routes = Routes.all
    end 

    def new
        @route = Routes.new 
    end 

    def create 
       @route = Route.new(route_params)
       if @route.save
         redirect_to new_route_direction_path(@route)
       else 
        render :new
       end 
    end 

    private 

    def route_params
       params.require(:route).permit(:name)
    end 
end 