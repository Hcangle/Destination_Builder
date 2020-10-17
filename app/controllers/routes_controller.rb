class RoutesController < ApplicationController

    def index 
        @routes = Route.all
    end 

    def new
        @route = Route.new   
    end 

    def create 
       @route = Route.new(route_params)
       if @route.save
         redirect_to route_path(@route)
       else 
        render :new
       end 
    end 

    private 

    def route_params
       params.require(:route).permit(:name)
    end 
end 