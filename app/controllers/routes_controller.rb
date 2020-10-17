class RoutesController < ApplicationController

    def index 
        @routes = Routes.all
    end 

    def new
        @route = Routes.new 
        redirect_to routes_path
    end 

    def create 
       @route = Route.build(route_params)
       if @route.save
         redirect_to route_direction_path(@route)
       else 
        render :new
       end 
    end 

    private 

    def route_params
       params.require(:route).permit(:name)
    end 
end 