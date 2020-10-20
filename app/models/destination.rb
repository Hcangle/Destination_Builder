class Destination < ApplicationRecord
    has_many :directions 
    has_many :routes, through: :directions 
    validates_presence_of :location
    scope :visited, -> { where(category: 'Visited') }

    # make my class scope based on have you been to this destination or not 
    # make scopes on location (east coast, west coat, north, south, central)
    # rolleback??
    
end
