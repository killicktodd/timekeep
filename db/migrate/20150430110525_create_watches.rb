class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
	t.string :name
	t.string :style
	t.string :gender
	t.string :brand

	t.text :description
    
	t.integer :price_in_pence
	t.integer :user_id

	t.boolean :pre_owned, default: false

	t.timestamps
    end
  end
end
