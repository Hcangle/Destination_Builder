class RoutesController < ApplicationController
  

    def index 
        #params give info from(view) form or url
        if params[:user_id]
          @user = User.find_by_id(params[:user_id])
          @routes = @user.routes
        else 
            @routes = Route.all
        end 
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