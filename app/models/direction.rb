class Direction < ApplicationRecord 
    belongs_to :destination 
    belongs_to :route
end 