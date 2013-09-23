class CreateSpreeLookProducts < ActiveRecord::Migration
  def change
    create_table :spree_look_products do |t|
      t.integer :look_id
      t.integer :product_id
      t.boolean :active, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
