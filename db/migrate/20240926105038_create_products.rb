class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, default: 0.0
      t.text :description
      t.boolean :published, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :user_id
  end
end
