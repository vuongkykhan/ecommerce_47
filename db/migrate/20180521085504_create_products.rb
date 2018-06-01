class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.string :image
      t.integer :quantity
      t.integer :del_flash, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
