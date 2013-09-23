class CreateSpreeLookbooks < ActiveRecord::Migration
  def change
    create_table :spree_lookbooks do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.boolean :active, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
