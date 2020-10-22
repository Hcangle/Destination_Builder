class DestinationsController < ApplicationController
    

    def index 
        if logged_in?
        @destinations = current_user.destinations

        else 
            redirect_to login_path
        end 
    end 

    def new
        @destination = Destination.new   
    end 

    def create 
       @destination = Destination.new(destination_params)
       @destination.user_id = current_user.id 
       if params[:visited] == "yes"
        @destination.visited = true
       else 
        @destination.visited = false 
       end 
       if @destination.save
         redirect_to destinations_path(@destination)
       else 
        render :new
       end 
    end 

    def show 
     @destination = Destination.find_by_id(params[:id])
     render :show
    end 


    def visited
     @destinations = Destination.visited 
     render :visited
    end 


    def edit
        @destinations = Destination.find_by_id(params[:id])
        redirect_to edit_destination_path
    end

    def update
        @destination.update(destination_params)
        redirect_to destination_route_path(@destination)
    end 

    def destroy
        if logged_in?
            @destination = Destination.find_by_id(params[:id])
            if @destination && @destination.user == current_user
              @destination.delete
            
            redirect to destinations_path
            end
          else
            redirect to login_path
          end
        end



    private 

    def destination_params
       params.require(:destination).permit(:location)
    end 
end 
