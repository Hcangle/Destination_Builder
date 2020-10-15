class Directions < ApplicationRecord 
    belongs_to :destination 
    belongs_to :routes
end 