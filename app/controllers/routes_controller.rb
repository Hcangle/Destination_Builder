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

    def show 
        @route = Route.find_by_id(params[:id])
     render :show
    end 

    def destroy 
    end 
    

    private 

    def route_params
       params.require(:route).permit(:name)
    end 
end 