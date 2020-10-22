class Destination < ApplicationRecord
    has_many :directions 
    has_many :routes, through: :directions 
    belongs_to :user
    validates_presence_of :location
    scope :visited, -> { where(visited: true) }
    
end
