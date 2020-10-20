class DestinationsController < ApplicationController

    def index 
        @destinations = Destination.all  
    end 

    def new
        @destination = Destination.new   
    end 

    def create 
       @destination = Destination.new(destination_params)
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


    def destroy 
    end 



    private 

    def destination_params
       params.require(:destination).permit(:location)
    end 
end 
