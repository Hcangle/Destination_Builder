class Destination < ApplicationRecord
    has_many :directions 
    has_many :routes, through: :directions 
    validates_presence_of :location
    scope :visited, -> { where(category: 'Visited') }
    
end
