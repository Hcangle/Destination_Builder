class RoutesController < ApplicationController
  

    def index 
        @routes = current_user.routes
    end 

    def new
        @route = Route.new   
    end 

    def create 
       @route = current_user.routes.build(route_params)
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