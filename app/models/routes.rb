class Routes < ApplicationRecord 
# belongs_to :user
has_many :directions
has_many :destinations, through: :directions
validates_presence_of :name 
end 