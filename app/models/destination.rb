class Destination < ApplicationRecord
    has_many :routes 
    has_many :directions, through: :routes 
end
