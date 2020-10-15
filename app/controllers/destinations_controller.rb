class DestinationsController < ApplicationController

    def index 
        @destinations = Destination.all 
        #im just adding something new so this actually saves 
    end 
end 
