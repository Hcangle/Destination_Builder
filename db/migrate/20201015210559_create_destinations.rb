class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :location 
      t.text :description
      t.date :date_traveled 
      t.boolean :visited, :nul => false, :default => false 
      t.integer :user_id

      t.timestamps
    end
  end
end
