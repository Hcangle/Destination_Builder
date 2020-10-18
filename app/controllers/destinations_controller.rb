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

    private 

    def destination_params
       params.require(:destination).permit(:location)
    end 
end 
