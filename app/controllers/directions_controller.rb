class DirectionsController < ApplicationController

    def index 
      @route = Route.find_by(id: params[:route_id])

    end 

    def new 
    
    end 

    def create 

    end 