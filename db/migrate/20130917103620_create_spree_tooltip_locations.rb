class CreateSpreeTooltipLocations < ActiveRecord::Migration
  def change
    create_table :spree_tooltip_locations do |t|
      t.integer :tooltip_id
      t.string :location_id
      t.string :description
      t.string :top
      t.string :left
      
      t.timestamps
    end
  end
end
