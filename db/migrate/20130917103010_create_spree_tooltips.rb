class CreateSpreeTooltips < ActiveRecord::Migration
  def change
    create_table :spree_tooltips do |t|
      t.boolean :animation
      t.string :animationType
      t.string :animationBg
      t.string :button
      t.string :tooltipable_type
      t.integer :tooltipable_id

      t.timestamps
    end
  end
end
