class CreateDirections < ActiveRecord::Migration[6.0]
  def change
    create_table :directions do |t|
      t.integer :destination_id
      t.integer :route_id 
      t.integer :duration 
      t.text :variation 
    end
  end
end
