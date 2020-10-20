class Route < ApplicationRecord 
   belongs_to :user
   has_many :directions
   has_many :destinations, through: :directions
   validates_presence_of :name 

   def duration 
     self.directions.sum do |direction|
         direction.duration 
     end 
   end 
end 