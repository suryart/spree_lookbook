class CreateSpreeLookbookCollections < ActiveRecord::Migration
  def change
    create_table :spree_lookbook_collections do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.boolean :active, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end

    add_column :spree_lookbooks, :lookbook_collection_id, :integer
  end
end
