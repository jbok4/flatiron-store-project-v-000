class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :item_id
    end
    add_index :line_items, :cart_id
    add_index :line_items, :item_id
  end
end