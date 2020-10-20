class Direction < ApplicationRecord 
    belongs_to :destination 
    belongs_to :route
    validates_presence_of :duration
end 