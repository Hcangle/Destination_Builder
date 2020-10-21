class DestinationsController < ApplicationController
    

    def index 
        @destinations = current_user.destinations
    end 

    def new
        @destination = Destination.new   
    end 

    def create 
       @destination = Destination.new(destination_params)
       @destination.user_id = current_user.id 
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
     render :index
    end 


    def edit
        if @destination.user.first != @current_user
            flash[:alert] = "You are not authorized to view that page."
            redirect_to destinations_path  
        end
    end

    def update
        @destination.update(destination_params)
        redirect_to destination_route_path(@destination)
    end 

    def destroy
        @destination.destroy
        flash[:notice] = "Sucessfully Deleted Destination!"
        redirect_to destinations_path
    end 



    private 

    def destination_params
       params.require(:destination).permit(:location)
    end 
end 
