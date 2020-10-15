class Routes < ApplicationRecord 
# belongs_to :user
has_many :destinations, through: :directions
end 